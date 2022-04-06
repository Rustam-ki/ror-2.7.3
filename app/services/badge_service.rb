class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    set_test_passages
    @badges = Badge.where.not(id: @user.badges.ids)
  end

  def call
    @badges.select { |badge| send(badge.rule, badge.option) }
  end


  def category?(category)
    test_ids = Category.find(category).tests.ids
    test_passages = @user.test_passages.where(test_id: test_ids)
    test_passages.all?(&:success?)
  end

  def madness?(count)
    return false if @current_test_passages.count != count

    @current_test_passages.none?(&:success?)
  end

  def cool?
    @current_test_passages.count == 1 if @test_passage.successfull?
  end

  def passed_tests_of_level?(level)
    @current_test_passages.size == Test.where(level: level.to_i).count
  end

  def count_tests_success(test_ids)
    @user.test_passages.where(test_id: test_ids).successful.uniq.count
  end

  def set_test_passages
    @current_test_passages = @user.test_passages.where(test: @test)
  end
end