Rails.application.routes.draw do
  root 'application#hello'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passage, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :users, only: :create
  get :signup, to: 'users#new'
end
