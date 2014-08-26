require 'spec_helper'

describe User do
  describe 'Adding a question' do
    it 'adds to users question' do
      question = Question.new body: "They cannot be compared"
      user = create :user
      user.add_question question

      expect(user.questions).to include question
    end

    it 'links to the user' do
      question = Question.new body: "They cannot be compared"
      user = create :user
      user.add_question question

      expect(question.user).to eq user
    end
  end

  describe 'following' do
    describe 'user record' do
      it 'can follow a user' do
        user = create :user, email: "me@gmail.com"
        another_user = create :user, email: "someone@gmail.com"

        user.follow_user! another_user

        expect(user.following_users).to include another_user
      end

      it 'is not a 2 way relationship' do
        user = create :user, email: "me@gmail.com"
        another_user = create :user, email: "someone@gmail.com"

        user.follow_user! another_user

        expect(another_user.following_users).not_to include user
      end

      it 'cannot follow a person multiple times' do
        user = create :user, email: "me@gmail.com"
        another_user = create :user, email: "someone@gmail.com"

        user.follow_user! another_user

        expect {
          user.follow_user! another_user
        }.to raise_exception Exceptions::UnableToFollowError
      end

      it 'cannot follow his own record' do
        user = create :user

        expect {
          user.follow_user! user
        }.to raise_exception Exceptions::UnableToFollowError
      end
    end

    describe '#following?' do
      it 'returns true if user follows a model' do
        user = create :user
        another_user = create :user

        user.follow_user! another_user

        expect(user.following?(another_user)).to eq true
      end

      it 'returns false otherwise' do
        user = create :user
        another_user = create :user
        stranger = create :user

        user.follow_user! another_user

        expect(user.following?(stranger)).to eq false
      end
    end

    describe "#unfollow_user!" do
      it 'unfollows the user' do
        user = create :user, email: "me@gmail.com"
        another_user = create :user, email: "someone@gmail.com"
        somebody = create :user

        user.follow_user! another_user
        user.follow_user! somebody
        user.unfollow_user! another_user

        expect(user.following_users.count).to eq 1
      end
    end
  end
end
