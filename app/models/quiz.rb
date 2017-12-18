class Quiz < ApplicationRecord
  has_many :questions
  has_many :quiz_responses

  validates :name, presence: true

  def completed_for?(user)
    response = quiz_responses.find_by(user: user)

    return false if response.blank?

    questions.count == response.answers.count
  end

  def question_to_display_for(user)
    response = quiz_responses.find_by(user: user)

    if response.blank? || response.answers.blank?
      questions.first
    else
      next_question_for(response)
    end
  end

  private

  def next_question_for(response)
    previously_answered_question = response.answers.last.question

    questions.where('id > ?', previously_answered_question.id).first
  end
end
