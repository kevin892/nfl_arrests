Rails.application.routes.draw do
  resources :touchdowns
 resources :teams
 resources :players

 get "search", to: "players#index"
end
