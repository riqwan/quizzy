require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:quiz) }
    it { is_expected.to have_many(:choices) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:text) }
  end
end