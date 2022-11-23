# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors
require 'dotenv/load'

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins "#{ENV['CORS_URL']}"
    if Rails.env.production?
      origins 'https://bike-fuel-simulator.web.app/'
    else
      origins 'http://127.0.0.1:5173/'
    end
    

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
