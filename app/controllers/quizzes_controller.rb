class QuizzesController < ApplicationController
  before_action :find_user, only: [:show]
  before_action :find_quiz, only: [:show]

  def show
    render :no_quiz and return  if @quiz.blank?
    render :user_details and return  if @user.blank?
    render :results and return  if @quiz.completed_for?(@user)

    @question = @quiz.question_to_display_for(@user)
  end

  private

  def find_quiz
    # Assuming that there is only going to be one quiz on this application
    @quiz = Quiz.first
  end

  def find_user
    @user = User.find_by(uid: cookies[:user_uid])
  end
end
