class TestPassageController < ApplicationController
  before_action :set_test_passage, only: %i[gist result show update]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      BadgeService.new(@test_passage).call
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage), status: :see_other
    else
      render_next_question
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.call

    if service.success?
      current_user.authored_gists.create!(question: @test_passage.current_question,
                                          author_id: current_user,
                                          url: result.html_url,
                                          github_gist_id: result.id)
      flash[:notice] = new_gist_notification_message(result)
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage, status: :see_other
  end

  private

  def render_next_question
    render turbo_stream: turbo_stream.replace(
      'show_answers',
      template: 'test_passage/show',
      layout: false
    )
  end

  def new_gist_notification_message(source)
    "#{t('.gist.success')} #{view_context.link_to(t('.gist.view_gist'), source.html_url, target: :_blank)}"
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
