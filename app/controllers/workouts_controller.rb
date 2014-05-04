class WorkoutsController < ApplicationController
  def index
    if user_signed_in?
  	 @workouts = Workout.all

    else
      @workouts = []
    end
  end

  def index_scoped
    if params[:scope_param] == "top"
      @workouts = Workout.top
    end
    if params[:scope_param] == "by_cat"
      @workouts = Workout.by_cat
    end
    if params[:scope_param] == "by_newest"
      @workouts = Workout.by_newest
    end
    if params[:scope_param] == "by_user"
      @workouts = Workout.by_user
    end
    render 'index'
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
   @comments = Comment.where(workout_id: @workout.id).order(created_at: :desc).limit(5)
  end

 #  end

  def vote_up
    @workout = Workout.find(params[:id])
    begin
      current_user.vote_for(@workout)
    rescue ActiveRecord::RecordInvalid
    end
    redirect_to workouts_path  
  end

  def vote_down
    @workout = Workout.find(params[:id])
    begin
      current_user.vote_against(@workout)
    rescue ActiveRecord::RecordInvalid
    end
      redirect_to workouts_path
  end

    def unvote
    @workout = Workout.find(params[:id])
    begin
      current_user.unvote_for(@workout)
    rescue ActiveRecord::RecordInvalid
    end
      redirect_to workouts_path
  end

end
