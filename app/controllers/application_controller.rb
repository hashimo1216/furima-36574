class ApplicationController < ActionController::Base
  before_action :basic_auth


  private

  def basic_auth
    if Rails.env.production?
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['hashimo'] && password == ENV['1111']
    end
    end
  end
end
