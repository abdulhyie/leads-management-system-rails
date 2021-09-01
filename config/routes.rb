Rails.application.routes.draw do
  default_url_options :host => "example.com"
  root to: "user#index"
  devise_for :users
  resources :roles
  resources :leads
  resources :phases
  resources :projects
  resources :comments
  resources :phase_assignments
  get "/all_users", to: "user#all_users"
  get "/new_user", to: "user#new_user"
  get "/phase_requests", to: "phases#phase_requests"
  get "/phase_accept_decline/:id", to: "phases#accept_decline"
  get "/phase/add_engineer/:id", to: "phases#add_engineer"
  post "create_user", to: "user#create_user"
  delete "destroy_user/:id", to: "user#destroy_user"
  get "/assign_roles", to: "user#assign_roles"
  post "/create_role", to: "user#create_role"
  get "/user_roles", to: "roles#user_roles"
  delete "/destroy_user_role/:id", to: 'roles#destroy_user_role'
  patch "/set_phase_status/:id", to: "phases#set_phase_status"
  patch "/phase/mark_complete/:id", to: "phases#mark_complete"
  patch "/lead/mark_complete/:id", to: "leads#mark_complete"
  get "/phase_assignment/generate_form", to: "phase_assignments#generate_form"
  get "user/my_phases", to: "user#my_phases"
end
