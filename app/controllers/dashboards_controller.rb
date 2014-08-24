class DashboardsController < ApplicationController
  def show
    @question_list = QuestionList.new
  end
end
