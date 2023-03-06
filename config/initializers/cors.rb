Rails.application.config.middleware.insert_before 0, Rack::Cors do
  # allow do
  #   origins 'https://nikolaz.tech'
  #   resource '/api/v1/portfolio_articles', headers: :any, methods: [:get]
  # end
  # allow do
  #   origins 'https://www.nikolaz.tech'
  #   resource '/api/v1/portfolio_articles', headers: :any, methods: [:get]
  # end
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get]
  end
end
