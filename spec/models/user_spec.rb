require 'spec_helper'

describe User do
  describe 'Adding a question' do
    it 'adds to users question' do
      question = Question.new body: "They cannot be compared"
      user = create(:user)
      user.add_question question

      expect(user.questions).to include question
    end

    it 'links to the user' do
      question = Question.new body: "They cannot be compared"
      user = create(:user)
      user.add_question question

      expect(question.user).to eq user
    end
  end
end
