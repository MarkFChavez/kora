require 'test_helper'

class TestUser < ActiveSupport::TestCase
  def setup
    @question = Question.new title: "Which is better? Ruby or Python?", body: "They cannot be compared"
  end

  def test_that_it_will_add_question
    user = users :mark
    user.ask @question

    assert_includes user.questions, @question
  end

  def test_that_it_is_linked_to_a_user
    user = users :mark
    user.ask @question

    assert_equal @question.user, user
  end
end
