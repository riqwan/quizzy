class Answer < ApplicationRecord
  belongs_to :choice
  belongs_to :question
  belongs_to :quiz_response

  validates :choice_id, uniqueness: { scope: [:question_id, :quiz_response_id] }
  validate :choice_cannot_change
  validate :quiz_response_cannot_change

  private

  def choice_cannot_change
    if choice_id_changed? && persisted?
      errors.add(:choice_id, 'Change of choice_id not allowed!')
    end
  end

  def quiz_response_cannot_change
    if quiz_response_id_changed? && persisted?
      errors.add(:quiz_response_id, 'Change of quiz_response_id not allowed!')
    end
  end
end
