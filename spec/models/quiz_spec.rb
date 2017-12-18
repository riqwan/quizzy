require 'rails_helper'

RSpec.describe Quiz, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:quiz_responses) }
    it { is_expected.to have_many(:questions) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end