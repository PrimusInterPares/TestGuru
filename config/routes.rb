Rails.application.routes.draw do

  root 'tests#index'

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

  resources :test_passage, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  devise_for :users,
             path_names: {
               sign_in: :login,
               sign_out: :logout
             },
             controllers: {
               sessions: 'users/sessions'
             }
end
