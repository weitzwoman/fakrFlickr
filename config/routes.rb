Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  root to: "home#index"
  # root :to => "home#index"

  resources :users, :only => [:index] do
    resources :images
  end
  resources :users, :only => [:show] do
    resources :tags
  
  end
  resources :images do

  end
end
