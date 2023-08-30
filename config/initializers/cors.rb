# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins '*'  # caution: this allows any origin. You might want to restrict this for production.
#     resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
#   end
# end
