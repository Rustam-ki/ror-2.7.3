class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @current_test_passages = @user.test_passages.where(test: @test)
    @badges = Badge.where.not(id: @user.badges.ids)
  end

  def call
    @badges.select { |badge| send(badge.rule, badge.option) }
  end

  def category?(category)
    return false if @test.category.title != category

    test_ids = Test.by_category_title(category).ids
    test_ids.size == count_tests_success(test_ids)
  end

  def madness?(count)
    test_passages = TestPassage.where(user: @user, test: @test, successfull: false).count

    false if test_passages != count
  end

  def cool?
    @current_test_passages.count == 1 if @test_passage.successfull?
  end

  def passed_tests_of_level?(level)
    sample_tests = Test.where(level: level.to_i).count

    sample_test_passages = count_tests_success(test_ids)

    sample_tests == sample_test_passages
  end

  def count_tests_success(test_ids)
    @user.test_passages.where(test_id: test_ids).successful.uniq.count
  end

end