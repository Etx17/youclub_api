Rails.application.routes.draw do
  resources :trainers

  get 'update_zipcode', to: 'clubs#update_zipcode'
  get 'update_category', to: 'clubs#update_category'
  get 'update_subcategories', to: 'clubs#update_subcategories'
  get 'admin_dashboard', to: 'pages#admin_dashboard'
  patch '/clubs/:id/mark_as_called', to: 'clubs#mark_as_called', as: 'mark_as_called'
  patch '/clubs/:id/update_comment', to: 'clubs#update_comment', as: 'update_comment_club'

  resources :activities do
    member do
      delete :remove_image
    end
    resources :sub_groups do
      resources :schedules do
        resources :time_slots
      end
    end
  end

  resources :comments

  resources :time_slots

  resource :claims
  resources :clubs do
    resources :claims, only: [:new, :create]
    collection do
      post :index
    end
    member do
      delete :remove_image
    end
  end

  get 'leads/create'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root to: 'pages#home'
  get 'pages/legal'
  get 'pages/dashboard'
  resources :leads, only: [:create]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
end
