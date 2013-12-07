require 'spec_helper'

describe Game do
  it {should have_many(:scores)}


  describe "#winner" do
    before do
      @game=FactoryGirl.create(:game) 
      @score1 = FactoryGirl.create(:score, game_id: @game.id, points: 1000)
      @score2 = FactoryGirl.create(:score, game_id: @game.id, points: 900)
    end

    it "should return false if there less than two players" do
      expect(@game.winner).to eq([@score1,@score2])
    end    
  end
end