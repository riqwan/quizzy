class AnswersController < ApplicationController
  before_action :find_user!
  before_action :find_question!
  before_action :find_choice!

  def create
    response = @user.quiz_response
    response = @user.create_quiz_response!(quiz: @question.quiz) if response.blank?
    answer = response.answers.build(question: @question, choice: @choice)

    if !answer.save
      flash[:error] = 'Something went wrong.'
    end

    redirect_to root_path
  end

  private

  def find_question!
    @question = Question.find(params[:question_id])
  end

  def find_user!
    @user = User.find_by!(uid: cookies[:user_uid])
  end

  def find_choice!
    @choice = @question.choices.find(params[:answer][:choice_id])
  end
end
