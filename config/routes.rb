Rails.application.routes.draw do

  devise_for :users
  get 'histories/my_histories', to: "histories#my_histories"

  get 'dashboard/index'

  resources :histories


  root "histories#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
