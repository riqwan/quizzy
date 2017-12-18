class Choice < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validates :correct, uniqueness: { scope: :question_id }, if: :correct?
end
