class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def result

  end

  def gist
    response = GistQuestionService.new(@test_passage.current_question)
    result = response.call
    @gist = current_user.gists.new(gist_url: result.html_url, user_id: current_user.id, question_id: @test_passage.current_question.id)

    flash_options = response.success? && @gist.save ? { notice: t('.success', link_gist: link_gist(result))} : { alert: t('.failure')}

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      @test_passage.update_successfull if @test_passage.success?
      distribution_badge
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end
  def distribution_badge
    badges = BadgeService.new(@test_passage).call
    if badges.present?
      current_user.badges << badges
      flash[:notice] = I18n.('Поздравляем!')
    end
  end
  private

  def link_gist(gist)
    view_context.link_to('Gist', gist.html_url, target: '_blank')
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
