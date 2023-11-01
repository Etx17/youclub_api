Rails.application.routes.draw do
  get 'update_zipcode', to: 'clubs#update_zipcode'
  get 'update_category', to: 'clubs#update_category'
  get 'update_subcategory', to: 'clubs#update_subcategory'
  resource :activities
  resources :clubs do
    collection do
      post :index
    end
  end

  get 'leads/create'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root to: 'pages#home'
  resources :leads, only: [:create]
end
