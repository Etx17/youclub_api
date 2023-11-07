Rails.application.routes.draw do
  get 'update_zipcode', to: 'clubs#update_zipcode'
  get 'update_category', to: 'clubs#update_category'
  get 'update_subcategory', to: 'clubs#update_subcategory'
  resources :activities
  resources :clubs do
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
