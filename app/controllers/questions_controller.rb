class QuestionsController < ApplicationController
  def show
    @answer_list = AnswerList.new get_question
    @answers = @answer_list.all
    @answers = @answers.page(params[:page])
  end

  def new
    @question = new_question
  end

  def create
    @question = Question.new(question_params)

    if current_user.add_question(@question)
      redirect_to dashboard_path, notice: "New question has been added"
    else
      render :new
    end
  end

  private

  def get_question
    Question.find params[:id]
  end

  def new_question
    Question.new
  end

  def question_params
    params.require(:question).
      permit(:body)
  end
end
