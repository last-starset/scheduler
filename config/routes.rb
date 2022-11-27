Rails.application.routes.draw do
  root 'work_orders#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :technicians do
    resources :work_orders
  end

  
end
