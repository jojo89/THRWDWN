class ScoresController < ApplicationController
  
  def show
    @game = Game.find(params[:game_id])
    @score = Score.find(params[:id])
    @roll = Roll.new
  end	


  def new
    @game = Game.find(params[:game_id])	
  end

  def create
  	@score1 = Score.create(game_id:params[:game_id], name:params[:name1])
  	@score2 = Score.create(game_id:params[:game_id], name:params[:name2])
    
    redirect_to game_score_path(params[:game_id], @score1)


  end


end	