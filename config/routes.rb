Rails.application.routes.draw do
  # get 'urls/index'
  # get 'urls/show'
  # get 'urls/create'

  resources :urls, only: [:create, :index]
  root 'urls#index'

  get 'url/:short_url' => 'urls#show', as: :short_url
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
