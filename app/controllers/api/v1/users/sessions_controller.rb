class Api::V1::Users::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: user_params[:email])
                .try(:authenticate, user_params[:password])

    if @user
      render json: { body: UserSerializer.new(@user) }, status: 201
    else
      render json: { body: 'User not found' }, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
