Rails.application.routes.draw do
  resources :places do
  	resources :comments
  end

  root 'places#index'

end
