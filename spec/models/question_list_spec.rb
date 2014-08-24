require 'spec_helper'

describe QuestionList do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:question1) { create(:question, user: user1) }
  let!(:question2) { create(:question, user: user2) }

  it 'lists all the questions' do
    question_list = QuestionList.new
    expect(question_list.questions).to eq [question1, question2]
  end

  it 'gets the user questions' do
    question_list = QuestionList.new(user1)
    expect(question_list.questions).to eq [question1]
  end
end
