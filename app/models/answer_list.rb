class AnswerList
  attr_reader :question

  def initialize question
    @question = question
  end

  def all
    @question.answers
  end
end
