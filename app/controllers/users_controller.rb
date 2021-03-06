class UsersController < ApplicationController
    
  def index 
    users = User.all 
    render json: users, status: 201
  end

  def new
    user = User.new
  end

  def create
    user = User.new(user_params)
    #  byebug
    if user.save
    #   flash[:success] = "Have fun"
      # redirect_to user
      render json: user, status: 200
    else
      # render 'new'
      render json: {'msg': 'didnt work brah'}, status: 404
    end
  end

  def update
    user = User.find_by(id: params[:id])
    user.update(clicks: params[:clicks], time: params[:time])
  end
    
  def user_params
    params.require(:user).permit(:username, :clicks, :time)
  end

end
