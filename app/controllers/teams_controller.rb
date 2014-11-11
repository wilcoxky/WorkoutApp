class TeamsController < ApplicationController
  def create
  	@team = Team.new(team_params)
  	if @team.save
  		redirect_to teams_path
  	else
  		render "new"
  	end
  end

  def new 
    @team = Team.new
  end

  def team_params
  	params.require(:team).permit(:name,:user_id)
  end

  def index
     @teams = Team.all
  end

  def follow
    @team = Team.find(params[:id])
    if current_user
      if current_user == @team
        flash[:error] = "You cannot follow yourself."
      else
        current_user.follow(@team)
      end
    else
    end
    redirect_to teams_path
  end

  def unfollow
    @team = Team.find(params[:id])
    if current_user
      current_user.stop_following(@team)
    else
    end
    redirect_to teams_path
  end
end
