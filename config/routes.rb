Rails.application.routes.draw do
  root 'quizzes#show'

  resources :users, only: [:create]
  resources :questions, only: [] do
    resources :answers, only: [:create]
  end
end
