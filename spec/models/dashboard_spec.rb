require 'spec_helper'

describe Dashboard do
  it 'gets all questions' do
    dashboard = Dashboard.new
    question1 = create :question
    question2 = create :question

    expect(dashboard.questions).to eq [question1, question2]
  end

  it 'gets all suggested users' do
    dashboard = Dashboard.new
    user = create :user
    another_user = create :user
    awesome_user = create :user

    expect(dashboard.suggested_users(user)).to eq [another_user, awesome_user]
  end
end
