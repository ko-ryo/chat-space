class UsersController < ApplicationController
  def index
    @users = User.where('name LIKE ?', "%#{params[:name]}%")
    render json: @users
  end
end
