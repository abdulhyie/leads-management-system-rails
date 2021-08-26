Rails.application.routes.draw do
  devise_for :users
  root to: "user#index"
  resources :roles  
  resources :leads
  get "/all_users", to: "user#all_users"
  get "/new_user", to: "user#new_user"
  post "create_user", to: "user#create_user"
  delete "destroy_user/:id", to: "user#destroy_user"
  get "/assign_roles", to: "user#assign_roles"
  post "/create_role", to: "user#create_role"
  get "/user_roles", to: "roles#user_roles"
  delete "/destroy_user_role/:id", to: 'roles#destroy_user_role'
end
