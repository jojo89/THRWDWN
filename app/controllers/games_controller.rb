class GamesController < ApplicationController
  def index
    @games = Game.all
  end  



  def show
   @game = Game.find(params[:id])
   @scores = @game.scores
   @score1 = @scores[0]
   @score2 = @scores[1]
   @roll1 = @score1.rolls
   @roll2 = @score2.rolls 
   count = @score1.rolls.length
   @count = count - 1
   p @count 
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