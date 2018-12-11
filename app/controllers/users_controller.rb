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
    byebug
    if user.type === "Customer"
      render json: {username: user.username, email: user.email, name: user.name, type: user.type, address: user.address, city: user.city, state: user.state, country: user.country, zipcode: user.zipcode}

    else
      render json: { username: user.username, email: user.email, name: user.name, type: user.type }
    # puts user
    # user_carts = user.cart
    end
  end

private

def user_params
  params.require(:user).permit(:username, :password, :name, :email, :type, :address, :city, :state, :country, :zipcode)
end

end
