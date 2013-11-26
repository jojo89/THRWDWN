class ScoresController < ApplicationController

  def new
    @game = Game.find(params[:game_id])	
    @score1 = Score.new 
    @score2 = Score.new
  end

  def create
  	
  end


end	