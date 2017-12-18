class QuizResponse < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  has_many :answers

  validates :user_id, uniqueness: { scope: :quiz_id }
end
