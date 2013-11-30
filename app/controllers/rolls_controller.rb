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

  end	

 def update
  @roll = Roll.find(params[:id])

  p params[:data]
  p 'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj'
  @score  =@roll.count_up(params[:data])

  if @score == 0
    p "nope wrong"
  else
    @dice = @roll.throw_dice
    p @dice
    render :json => {:data => @score, :dice => @dice} 
  end  
 end

 def finished
   @roll = Roll.find(params[:id])
   @score = Score.find(params[:score_id])
   @game = Game.find(params[:game_id])
   @score.points = @score.points + @roll.points
   
   @score.save

 end	


end	