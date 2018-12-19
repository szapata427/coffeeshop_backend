class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    # byebug
    # exclamtion point so it gives us the user back that was just created
     # and an error message if there is one

     # byebug
    if @user.valid?
      token = JWT.encode({user_id: @user.id}, 'SECRET')
      render json: {user_id: @user.id, username: @user.username, type: @user.type, name: @user.name, jwt: token}
    else
      render json: { error: "does not work" }, status: 422
    end
  end



private

def user_params
  params.require(:user).permit(:type, :username, :password, :name)
end

end
