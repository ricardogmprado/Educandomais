Rails.application.routes.draw do
  devise_for :donators
  devise_for :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :doanations, only: [:create, :index, :update, :edit]
    resources :photos, only: [:create]
    resources :donators, only: [:index]
  end
end
