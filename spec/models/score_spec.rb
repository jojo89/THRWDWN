require 'spec_helper'

describe Roll do
  it {should belong_to(:score)}
  it {should have_one(:game)}

  before do
    @game=FactoryGirl.create(:game)
    @score = FactoryGirl.create(:score, game_id: @game.id, points: 900)
    @roll = Roll.create(score_id: @score)
  end

  describe "#count_up" do

    it "should return false if there less than two players" do
      expect(@roll.count_up([3,3,3])).to eq(300)
      expect(@roll.dice_left).to eq(3)
      expect(@roll.hot_dice).to eq(3)
    end    
  end

  describe "#throw_dice" do
    it "should return an array of six integers" do
      expect(@roll.throw_dice.length).to eq(6)
    end  
  end	

end