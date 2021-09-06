Rails.application.routes.draw do
  default_url_options :host => "example.com"
  devise_for :users
  root to: "users#home"
  resources :users, except: [:edit, :update, :create] do
    collection do
      get 'my_phases'
      get 'phase_requests'
      post 'create_user'
    end
  end
  resources :user_roles, except: [:edit, :update]
  resources :roles, except: [:edit, :update]
  resources :leads, except: [:edit, :update] do
    patch 'mark_complete', on: :member
    resources :phases, shallow: true, only: [:create, :show, :destroy] do 
      member do
        get 'accept_decline'
        patch 'set_phase_status'
        patch 'mark_complete'
        get 'add_engineer'
      end
    end
  end
  resources :projects, only: [:index]
  resources :comments, only: [:create, :destroy]
  resources :phase_assignments, only: [:create, :show, :destroy] do
    get 'generate_form', on: :member
  end
end
