require 'spec_helper'

describe AnswerList do
  it 'lists all answers to the question' do
    question = create :question
    correct_answer = create :answer, question: question
    another_answer = create :answer, body: "another answer"

    answer_list = AnswerList.new question
    expect(answer_list.all).to eq [correct_answer]
  end

  it 'can get the question' do
    question = create :question
    answer_list = AnswerList.new question

    expect(answer_list.question).to eq question
  end
end
