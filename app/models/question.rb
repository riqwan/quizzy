class Question < ApplicationRecord
  belongs_to :quiz
  has_many :choices

  validates :text, presence: true
end
