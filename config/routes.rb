Rails.application.routes.draw do
  devise_for :donators, path: 'donators', controllers: { sessions: "donators/sessions", registrations: 'donators/registrations' }
  devise_for :teachers, path: 'teachers', controllers: { sessions: "teachers/sessions", registrations: 'teachers/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :donations, only: [:new, :create, :index, :update, :edit]
    resources :photos, only: [:create]
    resources :donators, only: [:index]
  end
  resources :payments, only: [:new]

  root to: 'pages#home'
  get 'institucional', to: 'pages#institucional', as: :institucional
end
