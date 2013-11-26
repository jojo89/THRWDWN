class ScoresController < ApplicationController

  def new
    @game = Game.find(params[:game_id])	
  end

  def create
  	@score1 = Score.create(game_id:params[:game_id], name:params[:name1])
  	@score2 = Score.create(game_id:params[:game_id], name:params[:name2])
  	p @score1
  	p @score2
  end


end	