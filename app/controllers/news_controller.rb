# frozen_string_literal: true

# app/controllers/news_controller.rb
class NewsController < ApplicationController
  def index
    api_service = NewsApiService.new(ENV['NEWS_API_KEY'])
    # byebug
    @articles = api_service.top_headlines
  rescue StandardError
    # Handle API request errors here, e.g., log the error or display an error message.
    # For simplicity, we'll set @articles to an empty array in case of an error.
    @articles = []
  end
end
