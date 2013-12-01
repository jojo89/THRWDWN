class GamesController < ApplicationController

  def show
   @game = Game.find(params[:id])
   @scores = @game.scores
   @score1 = @scores.first
   @score2 = @scores[1]
   
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