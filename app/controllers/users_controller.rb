class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  end

  def edit
  end

  def show
  	@user = User.find(params[:id])
  end

  def dash
  	@user = current_user
  end

  def follow
    @user = User.find(params[:id])
    if current_user
      if current_user == @user
        flash[:error] = "You cannot follow yourself."
      else
        current_user.follow(@user)
      end
    else
    end
    redirect_to users_path
  end

  def unfollow
    @user = User.find(params[:id])
    if current_user
      current_user.stop_following(@user)
    else
    end
    redirect_to users_path
  end

end
