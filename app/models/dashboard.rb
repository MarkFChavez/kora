class Dashboard
  def initialize params = {}
    @params = params
  end

  def questions
    Question.all.page @params[:page] if @params

    Question.all
  end

  def suggested_users user
    User.all.limit(5).to_a - [user]
  end
end
