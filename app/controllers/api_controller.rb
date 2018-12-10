class ApiController < ApplicationController

  def require_login
    authenticate_token || render_unauthorized("Acess denied")

  end

  def current_user
    @current_user ||= authenticate_token
  end

  protected

  def render_unauthorized(message)
    error = { errors: [detail: message ] }
    render json: errors, status: :unauthorized
  end

private

def authenticate_token
  authenticate_with_http_token do |token, options|
    User.find_by(auth_token: token)
  end
end

end
