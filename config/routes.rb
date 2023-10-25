Rails.application.routes.draw do
  get 'leads/create'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root to: 'pages#home'
  resources :leads, only: [:create]
end
