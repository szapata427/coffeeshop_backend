class ApplicationController < ActionController::API
  include
  ActionController::HttpAuthentication::Token::Controller
  Methods
end
