Rails.application.routes.draw do

  resources :categories, only: [:index, :show]
  resources :searches, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, except: [:destroy, :index]

  resources :questions do
    resources :comments, only: [:create]
    resources :answers
  end

  # since we are not using a resource, I'd like to see you use a
  # scope here instead of declaring resources :answers, only: []
  scope path: '/answers/:answer_id', as: 'answer' do
    resources :comments, only: [:create]
  end

  root 'questions#index'

end
