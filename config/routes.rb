Rails.application.routes.draw do
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  devise_for :users, :controllers => { :registrations => 'registrations' }
  root to: 'pages#index'

  resources :posts do
    collection do
      get 'hobby'
      get 'study'
      get 'team'
    end
  end
end
