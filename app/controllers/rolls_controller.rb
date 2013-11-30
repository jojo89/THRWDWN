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
  first_value = @roll.points
  @score  = @roll.count_up(params[:data])
  updated_value = @roll.points
  p @roll.changed?
  if first_value == updated_value || @roll.changed? == true
  	@different = false
    render :json => {:data => @roll.points_was, :updated => @different }
  else
  	@different = true
    render :json => {:data => @score, :updated => @different }
  end
 end

 def finished
   @roll = Roll.find(params[:id])
   @score = Score.find(params[:score_id])
   @game = Game.find(params[:game_id])
   duplicate = @game.scores.dup.delete(@score).first
   if params[:scored_points] == "true"
     @score.points = @score.points + @roll.points
   else
   	 @roll.points = 0
   	 @roll.save
   end
   @score.save
   redirect_to game_score_path(@game,duplicate)
 end


 def new_dice
   @dice = [rand(1..6),rand(1..6),rand(1..6),rand(1..6),rand(1..6),rand(1..6)]
   render :partial => 'new_dice'
 end	



end	