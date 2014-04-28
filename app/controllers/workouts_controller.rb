class WorkoutsController < ApplicationController
  def index
    if user_signed_in?
  	 @workouts = Workout.all
    else
      @workouts = []
    end
  end

  def create
  	@workout = Workout.new(workout_params)
  	if @workout.save
  		redirect_to workouts_path
  	else
  		render "new"
  	end
  end

  def workout_params
  	params.require(:workout).permit(:title, :category, :excercise, :user_id)
  end

  def new
    if user_signed_in?
  	 @workout = Workout.new
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    if @workout.update_attributes(workout_params)
      redirect_to workout_path(@workout.id)
    else
      render "edit"
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect_to workouts_path
  end
  
  def show
   @workout = Workout.find(params[:id])
   @comments = Comment.where(workout_id: @workout.id).order(created_at: :desc)
  end

 def vote_for_workout
    begin
      current_user.vote_for(@workout = Workout.find(params[:id]))
      redirect_to workout_path(@workout.id) 
    rescue ActiveRecord::RecordInvalid
      redirect_to workout_path(@workout.id)  
    end
  end
  
  def vote_against_workout
    begin
      current_user.vote_against(@workout = Workout.find(params[:id]))
      redirect_to workout_path(@workout.id) 
    rescue ActiveRecord::RecordInvalid
      redirect_to workout_path(@workout.id) 
    end
  end
end
