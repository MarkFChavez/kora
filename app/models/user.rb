class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :following_users, through: :relationships, source: :followable, source_type: "User"

  def add_question question
    self.questions << question
  end

  def follow_user! user
    raise Exceptions::UnableToFollowError if following_users.include? user or user == self

    self.following_users << user
  end

  def unfollow_user! user
    self.relationships.where(followable: user).destroy_all
  end

  def following? model
    self.relationships.map(&:followable).include? model
  end
end
