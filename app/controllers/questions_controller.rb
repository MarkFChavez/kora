class QuestionsController < ApplicationController
  def new
    @question = new_question
  end

  def create
    @question = Question.new(question_params)

    if current_user.ask(@question)
      redirect_to dashboard_path, notice: "New question has been added"
    else
      render :new
    end
  end

  private

  def new_question
    Question.new
  end

  def question_params
    params.require(:question).
      permit(:body)
  end
end
