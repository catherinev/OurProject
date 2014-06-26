Rails.application.routes.draw do

  resources :users, except: [:destroy, :index]

  get '/questions/:question_id/comments', to: 'comments#index', as: :question_comments 
  post '/questions/:question_id/comments', to:     "comments#create"
  get '/questions/:question_id/comments/new', to: "comments#new", as: :new_question_comment
  get '/questions/:question_id/comments/:id/edit',to: "comments#edit", as: :edit_question_comment
  get '/questions/:question_id/comments/:id', to: "comments#show", as: :question_comment
  patch  '/questions/:question_id/comments/:id', to: "comments#update"
  put    '/questions/:question_id/comments/:id', to: "comments#update"
  delete '/questions/:question_id/comments/:id', to: "comments#destroy"
  get '/questions/:question_id/answers', to:     "answers#index", as: :question_answers
  post   '/questions/:question_id/answers', to: "answers#create"
  get '/questions/:question_id/answers/new', to:  "answers#new", as: :new_question_answer
  get '/questions/:question_id/answers/:id/edit', to: "answers#edit", as: :edit_question_answer
  get '/questions/:question_id/answers/:id', to:  "answers#show", as: :question_answer
  patch  '/questions/:question_id/answers/:id', to:  "answers#update"
  put    '/questions/:question_id/answers/:id', to:  "answers#update"
  delete '/questions/:question_id/answers/:id', to:  "answers#destroy"
  get '/questions', to: 'questions#index', as: :questions
  post '/questions', to: 'questions#create'
  get '/questions/new', to: 'questions#new', as: :new_question
  get '/questions/:id/edit', to: 'questions#edit', as: :edit_question
  get '/questions/:id', to: 'questions#show', as: :question
  patch '/questions/:id', to: 'questions#update'
  put '/questions/:id', to: 'questions#update'
  delete '/questions/:id', to: 'questions#destroy'

  # resources :questions do
  #   resources :comments
  #   resources :answers
  # end
  resources :answers, only: [] do
    resources :comments
  end
  resources :categories, only: [:index, :show]

  resources :sessions, only: [:new, :create, :destroy]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'questions#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
