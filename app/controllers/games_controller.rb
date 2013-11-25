class GamesController < ApplicationController

  def new
	@game = Game.new
  end

  def create
   @game = Game.create
   redirect_to new_game_score_path(@game)
  end	




end	