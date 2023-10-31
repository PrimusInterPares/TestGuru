Rails.application.routes.draw do

  root 'tests#index'

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  namespace :admin do
    resources :tests
  end

  resources :test_passage, only: %i[show update] do
    member do
      get :result
    end
  end

  devise_for :users,
             path_names: {
               sign_in: :login,
               sign_out: :logout
             }
end
