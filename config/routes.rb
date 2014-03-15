Video1::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products

  root :to => "home#index"
  get "home" => "home#index"
  
get 'product/Signs'
get 'product/Products'

get 'signs/regulatory'
get 'traffic_product/traffic_product'

end
