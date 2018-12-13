class AuthController < ApplicationController

  def create
    user = User.find_by(username: auth_params[:username])
    # byebug
    if user && user.authenticate(auth_params[:password])
      # render json: {user_id: user.id, username: user.username}
      # issue_token({user_id: user.id})
      token = JWT.encode({user_id: user.id}, 'SECRET')
      render json: {user: user, jwt: token}
    else
      render json: {message: "Wrong Password"}, status: 400
    end

  end

  def show
    string = request.authorization
    token = JWT.decode(string, 'SECRET')[0]
    # token = request.authorization.to_i
    id = token["user_id"].to_i
    @user = User.find(id)
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
