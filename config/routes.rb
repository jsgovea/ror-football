Rails.application.routes.draw do
  namespace :play do
    get 'calendar/index'
    get 'calendar/show'
    get 'simulation/index'
    get 'simulation/show'
    get 'settings/index'
    get 'settings/show'
    get 'team/index'
    get 'team/show'
    get 'league/index'
    get 'league/show'
    get 'home/index'
    get 'home/show'
  end

  get 'game_sessions/index'
  get 'game_sessions/show'
  get 'leagues/index'
  get 'leagues/show'
  get 'countries/show'
  devise_for :users

  require "sidekiq/web"
  mount Sidekiq::Web => '/sidekiq'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main_menu#index"
  #
end
