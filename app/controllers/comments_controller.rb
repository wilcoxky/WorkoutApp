class CommentsController < ApplicationController
  def index
  	@comments = Comment.all
  end

  def create
  	@comment = Comment.new(comment_params)
  	if @comment.save
      Notifications.new_comment(@comment).deliver
  		redirect_to workout_path(@comment.workout.id)
  	else
  		render "new"
  	end
  end

  def comment_params
  	params.require(:comment).permit(:body, :workout_id, :user_id)
  end

  def new
  	@comment = Comment.new
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to comment_path(@comment.id)
    else
      render "edit"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end

  def show
     @comment = Comment.find(params[:id])
  end
end
