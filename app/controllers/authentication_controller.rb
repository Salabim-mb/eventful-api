
class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result }, status: :ok
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def register
    @user = User.create(user_params)
    if @user.save
      command = AuthenticateUser.call(params[:email], params[:password])
      response = { message: 'User created successfully', auth_token: command.result }
      render json: response, status: :created
    else
      render json: @user.errors, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(
        :first_name,
        :last_name,
        :email,
        :password,
    )
  end
end
