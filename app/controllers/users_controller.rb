class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
    #Handled BY devise
  end

  def edit
  end

  def show
  	@user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def dash
    @following = current_user.following_users
    @fid = []
    @workouts = []
    @following.each do |f|
      @fid.push(f.id)
    end
    @workouts = Workout.where(user_id: @fid).order(created_at: :desc)
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
