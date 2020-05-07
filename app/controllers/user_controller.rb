
class UserController < ApplicationController
  skip_before_action :authenticate_request

  def get_data
    @user = User.find_by(token: token)

    if @user.present?
      render json: {data: @user.to_json}, status: :ok
    else
      render json: {error: @user.errors}, status: :not_found
    end
  end
end