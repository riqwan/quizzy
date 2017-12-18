require 'rails_helper'

RSpec.describe Answer, type: :model do
  let!(:first_quiz) { Quiz.create!(name: 'test quiz 1') }
  let!(:second_quiz) { Quiz.create!(name: 'test quiz 2') }
  let!(:first_user) { User.create!(name: 'test user 1', uid: '11101') }
  let!(:second_user) { User.create!(name: 'test user 2', uid: '11102') }
  let!(:first_quiz_response) { QuizResponse.create!(user: first_user, quiz: first_quiz) }
  let!(:second_quiz_response) { QuizResponse.create!(user: second_user, quiz: second_quiz) }
  let!(:question) { Question.create!(text: 'test question', quiz: first_quiz) }
  let!(:first_choice) { Choice.create!(text: 'test choice 1', question: question) }
  let!(:second_choice) { Choice.create!(text: 'test choice 1', question: question) }

  describe 'Associations' do
    it { is_expected.to belong_to(:question) }
    it { is_expected.to belong_to(:choice) }
    it { is_expected.to belong_to(:quiz_response) }
  end

  describe 'Validations' do
    it { is_expected.to validate_uniqueness_of(:choice_id).scoped_to(:question_id, :quiz_response_id) }

    context 'Choice' do
      let!(:answer) { described_class.create!(choice: first_choice, quiz_response: first_quiz_response) }

      it 'cannot change choice_id once set' do
        expect(answer.update(choice: second_choice)).to eq(false)
        expect(answer.errors.messages.fetch(:choice_id)).to include('Change of choice_id not allowed!')
      end
    end

    context 'Quiz' do
      let!(:answer) { described_class.create!(choice: first_choice, quiz_response: first_quiz_response) }

      it 'cannot change quiz_response_id once set' do
        expect(answer.update(quiz_response: second_quiz_response)).to eq(false)
        expect(answer.errors.messages.fetch(:quiz_response_id)).to include('Change of quiz_response_id not allowed!')
      end
    end
  end
end