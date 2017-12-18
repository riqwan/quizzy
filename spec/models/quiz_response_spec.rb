require 'rails_helper'

RSpec.describe QuizResponse, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:quiz) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:answers) }
  end

  describe 'Validations' do
    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:quiz_id) }
  end
end