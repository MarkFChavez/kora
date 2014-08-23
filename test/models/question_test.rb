require 'test_helper'

class TestQuestion < MiniTest::Test
  def setup
    @question = Question.new title: "Sample title",
      body: "Sample body"
  end

  def test_that_it_sets_the_title
    assert_equal @question.title, "Sample title"
  end

  def test_that_it_sets_the_body
    assert_equal @question.body, "Sample body"
  end
end
