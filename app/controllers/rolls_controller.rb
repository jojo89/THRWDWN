class RollsController < ApplicationController

  def index

  end	

  def create

  	@roll = Roll.create(score_id: params[:score_id])
  	redirect_to game_score_roll_path(params[:game_id],params[:score_id],@roll)
  end	

  def show
    @game = Game.find(params[:game_id])
  	@roll = Roll.find(params[:id])
  	@score = Score.find(params[:score_id])
  	@dice = @roll.throw_dice
    if request.xhr?
      render :json => {:dice => @dice }
    else

    end
  end	

 def update
  @roll = Roll.find(params[:id])
  @score  =@roll.count_up(params[:data])
  render :json => {:data => @score} 
 end

 def finished
   @roll = Roll.find(params[:id])
   @score = Score.find(params[:score_id])
   @game = Game.find(params[:game_id])
   @score.points = @score.points + @roll.points
   
   @score.save

 end	


end	