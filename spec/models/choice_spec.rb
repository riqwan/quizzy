require 'rails_helper'

RSpec.describe Choice, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:question) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:text) }

    context 'when choice is correct' do
      before { subject.correct = true }

      it { is_expected.to validate_uniqueness_of(:correct).scoped_to(:question_id) }
    end

    context 'when choice is incorrect' do
      before { subject.correct = false }

      it { is_expected.to_not validate_uniqueness_of(:correct) }
    end
  end
end