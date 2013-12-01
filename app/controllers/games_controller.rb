class GamesController < ApplicationController

  def show

  
  end	


  def new
	@game = Game.new
  end

  def create
   score = params["game"]["finishing_score"]
   @game = Game.create(:finishing_score => score.to_i)
   redirect_to new_game_score_path(@game)
  end	




end	