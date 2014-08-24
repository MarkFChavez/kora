class DashboardsController < ApplicationController
  def show
    @question_list = QuestionList.new
    @questions = @question_list.questions.page(params[:page])
  end
end
