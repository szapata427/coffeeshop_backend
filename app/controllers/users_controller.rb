class UsersController < ApiController
  before_action :require_login, except: [:create]

  def create
    user = User.create!(user_params)
    # exclamtion point so it gives us the user back that was just created
     # and an error message if there is one
    render json: { token: user.auth_token }
  end

  def profile
    user = User.find_by_auth_token!(request.headers[:token])
    user_carts = user.cart
    render json: {user: {username: user.username, email: user.email, name: user.name}, carts: user_carts}

  end

private

def user_params
  params.require(:user).permit(:username, :password, :name, :email)
end

end
