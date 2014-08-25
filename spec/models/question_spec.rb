require 'spec_helper'

describe Question do
  it 'sets the body' do
    question = Question.new body: "Sample body"
    expect(question.body).to eq "Sample body"
  end

  describe '#validations' do
    it { should validate_presence_of :body }
  end

  describe '#associations' do
    it { should belong_to :user }
    it { should have_many :answers }
  end

  describe '#add_answer' do
    it 'adds the answer to the question' do
      user = create :user
      someone = create :user
      question = create :question, user: user
      answer = build :answer, user: someone, question: question

      question.add_answer answer

      expect(question.answers.map(&:body)).to include answer.body
    end
  end
end
