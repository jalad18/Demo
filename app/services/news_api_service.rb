# frozen_string_literal: true

# app/services/news_api_service.rb
class NewsApiService
  include HTTParty
  base_uri 'https://newsapi.org/v2'

  def initialize(api_key)
    @api_key = api_key
  end

  def top_headlines
    response = self.class.get('/top-headlines', query: { country: 'us', apiKey: @api_key })
    puts "API Response: #{response.inspect}"
    response.parsed_response['articles']
  end
end
