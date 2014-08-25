class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy

  validates :body, presence: true

  def add_answer answer
    self.answers << answer
  end
end
