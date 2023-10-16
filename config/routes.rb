Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'application#hello'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true
    end
  end
end
