Rails.application.routes.draw do
 resources :teams
 resources :players

 get "search", to: "players#index"
end
