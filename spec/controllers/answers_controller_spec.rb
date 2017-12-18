require 'rails_helper'

describe AnswersController do
  describe 'POST #create' do
    let!(:first_quiz) { Quiz.create!(name: 'test quiz 1') }
    let!(:second_quiz) { Quiz.create!(name: 'test quiz 2') }
    let!(:first_user) { User.create!(name: 'test user 1', uid: '11101') }
    let!(:second_user) { User.create!(name: 'test user 2', uid: '11102') }
    let!(:first_quiz_response) { QuizResponse.create!(user: first_user, quiz: first_quiz) }
    let!(:second_quiz_response) { QuizResponse.create!(user: second_user, quiz: second_quiz) }
    let!(:first_question) { Question.create!(text: 'test question', quiz: first_quiz) }
    let!(:second_question) { Question.create!(text: 'test question', quiz: first_quiz) }
    let!(:first_choice) { Choice.create!(text: 'test choice 1', question: first_question) }
    let!(:second_choice) { Choice.create!(text: 'test choice 1', question: second_question) }

    context 'with valid attributes' do
      it 'saves the new answer for the question and choice' do
        request.cookies[:user_uid] = 11101

        expect{
          post :create, question_id: first_question.id, user_uid: first_user.uid, answer: { choice_id: first_choice.id }
        }.to change { Answer.count }.by(1)
      end

      it 'redirects to the root page' do
        request.cookies[:user_uid] = 11101

        expect(
          post :create, question_id: first_question.id, user_uid: first_user.uid, answer: { choice_id: first_choice.id }
        ).to redirect_to(root_path)
      end
    end

    context 'with invalid attributes' do
      it 'raises a record not found error when user doesnt exist' do
        expect{
          post :create, question_id: first_question.id, user_uid: first_user.uid, answer: { choice_id: first_choice.id }
        }.to raise_error(ActiveRecord::RecordNotFound)
      end

      it 'raises a record not found error when question doesnt exist' do
        request.cookies[:user_uid] = 11101

        expect{
          post :create, question_id: 999, user_uid: first_user.uid, answer: { choice_id: first_choice.id }
        }.to raise_error(ActiveRecord::RecordNotFound)
      end

      it 'raises a record not found error when choice doesnt exist' do
        request.cookies[:user_uid] = 11101

        expect{
          post :create, question_id: first_question.id, user_uid: first_user.uid, answer: { choice_id: nil }
        }.to raise_error(ActiveRecord::RecordNotFound)
      end

      it 'raises a record not found error when question from another quiz is used' do
        request.cookies[:user_uid] = 11101

        expect{
          post :create, question_id: second_question.id, user_uid: first_user.uid, answer: { choice_id: first_choice.id }
        }.to raise_error(ActiveRecord::RecordNotFound)
      end

      it 'raises a record not found error when choice from question quiz is used' do
        request.cookies[:user_uid] = 11101

        expect{
          post :create, question_id: first_question.id, user_uid: first_user.uid, answer: { choice_id: second_choice.id }
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end