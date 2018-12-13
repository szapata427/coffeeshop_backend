class AuthController < ApplicationController

  def create
    user = User.find_by(username: auth_params[:username])
    # byebug
    if user && user.authenticate(auth_params[:password])
      render json: {user_id: user.id, username: user.username}
    else
      render json: {message: "Wrong Password"}, status: 400
    end

  end

  def show
    token = request.authorization.to_i
    @user = User.find(token)
    if @user
      render json: { user_id: @user.id, username: @user.username}
    else
      render json: { error: "User not found" }, status: 422
  end
end

private

def auth_params
  params.require(:user).permit(:username, :password)

end

end
