class AuthController < ApplicationController
  
  # skip_before_action :authorized, only: [:create]


  def create
    # byebug
    user = User.find_by(username: auth_params[:username])
    if user && user.authenticate(auth_params[:password])
      # render json: {user_id: user.id, username: user.username}
      # issue_token({user_id: user.id})
      token = JWT.encode({user_id: user.id}, 'SECRET')
      render json: {username: user.username , user_id: user.id, jwt: token, type:user.type, user: user.name}
    else
      render json: {message: "Wrong Password"}, status: 400
    end

  end

  def show
    string = request.authorization
    # byebug
    token = JWT.decode(string, 'SECRET')[0]
    id = token["user_id"].to_i
    @user = User.find(id)
    if @user
      render json: { user_id: @user.id, username: @user.username, type: @user.type}
    else
      render json: { error: "User not found" }, status: 422
  end
end

private

def auth_params
  params.require(:user).permit(:username, :password)

end

end
