class AnswersController < ApplicationController
  before_action :get_question, only: [:new, :create]

  def new
    @answer = new_answer
  end

  def create
    @answer = Answer.new answer_params
    @answer.user = current_user

    if @question.add_answer @answer
      redirect_to @question, notice: "Your answer has been added"
    else
      render :new
    end
  end

  private

  def get_question
    @question = Question.find params[:question_id]
  end

  def new_answer
    Answer.new
  end

  def answer_params
    params.require(:answer).
      permit(:body)
  end
end
