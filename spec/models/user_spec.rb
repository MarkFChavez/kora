require 'spec_helper'

describe User do
  before do
    @question = Question.new body: "They cannot be compared"
  end

  describe 'Adding a question' do
    it 'adds to users question' do
      user = create(:user)
      user.ask @question

      expect(user.questions).to include @question
    end

    it 'links to the user' do
      user = create(:user)
      user.ask @question

      expect(@question.user).to eq user
    end
  end
end
