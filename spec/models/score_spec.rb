require 'spec_helper'

describe Roll do
  it {should belong_to(:score)}
  it {should have_one(:game)}


  describe "#count_up" do
    before do
      @game=FactoryGirl.create(:game)
      @score = FactoryGirl.create(:score, game_id: @game.id, points: 900)
      @roll = Roll.create(score_id: @score)
    end

    it "should return false if there less than two players" do
      expect(@roll.count_up([3,3,3])).to eq(300)
    end    
  end
end