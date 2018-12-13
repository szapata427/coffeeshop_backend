class UsersController < ApplicationController

  def create
    # byebug
    @user = User.create(user_params)
    # exclamtion point so it gives us the user back that was just created
     # and an error message if there is one
     
    if @user.valid?
      render json: {id: @user.id, username: @user.username, type: @user.type}
    else
      render json: { error: "does not work" }, status: 422
    end
  end



private

def user_params
  params.require(:user).permit(:type, :username, :password, :name)
end

end
