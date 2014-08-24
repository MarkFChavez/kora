require 'spec_helper'

describe Question do
  before :each do
    @question = Question.new body: "Sample body"
  end

  it 'sets the body' do
    expect(@question.body).to eq "Sample body"
  end

  describe '#validations' do
    it { should validate_presence_of(:body) }
  end
end
