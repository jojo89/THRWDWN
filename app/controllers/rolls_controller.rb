class RollsController < ApplicationController

  def index

  end	

  def create

  	@roll = Roll.create(score_id: params[:score_id])
  	redirect_to game_score_roll_path(params[:game_id],params[:score_id],@roll)
  end	

  def show
  	p params
  	@roll = Roll.find(params[:id])
  	@dice =[]
  	@roll.dice_left.times do
  	  	@dice << rand(1..6)
  	end
  end	


end	