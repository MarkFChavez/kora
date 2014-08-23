require 'test_helper'

class TestUser < MiniTest::Test
  def test_that_it_will_add_question
    question = Question.new
    question.title = "Which is better? Ruby or Python?"
    question.body = "They cannot be compared."

    user = User.new
    user.ask(question)

    user.questions.must_include question
  end
end
