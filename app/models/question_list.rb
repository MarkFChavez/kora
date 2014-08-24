class QuestionList
  def initialize user = nil
    @user = user
  end

  def questions
    return @user.questions if @user

    Question.all
  end
end
