Rails.application.routes.draw do
  get 'home', to: 'pages#home', as: :home
  get 'about_us', to: 'pages#about_us', as: :about_us
  get 'our_data', to: 'pages#our_data', as: :our_data
  get 'hall_of_fame', to: 'pages#hall_of_fame', as: :hall_of_fame
  get 'resources/candidates', to: 'pages#candidates'
  get 'resources/apprentices', to: 'pages#apprentices'
  get 'resources/employers', to: 'pages#employers'
  get 'resources/educators', to: 'pages#educators'
  get 'apply_now', to: 'pages#apply_now', as: :apply_now
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
