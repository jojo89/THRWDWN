class Roll < ActiveRecord::Base
    belongs_to :score
    has_one :game, through: :score
	has_one :user, through: :score



def dice_left
  all_dice = [self.dice_1,self.dice_2,self.dice_3,self.dice_4,self.dice_5,self.dice_6]
  remaining_dice = []
  dice.each do |d|
    if d > 0
      remaining_dice << d
    end    
  end	
  remaining_dice
end


  def score
    dice = self.dice_left.count
    if dice.length == 6
      dice.e

      end





	end    
 #    while dice.length >= 3
	#   if dice.count(1) == 3 
	#     self.points + 1000
	#   elsif dice.count(2) == 3
	#    	self.points + 200
	#   elsif dice.count(3) == 3
	#     self.points + 300
	#   elsif dice.count(4) == 4
	#     self.points + 400
	#   elsif dice.count(5) == 3
	#     self.points + 500
	#   elsif dice.count(6) == 3
	#     self.points + 600
	#   end
	# elsif dice.count == 1
	#   if dice.first == 1
	#     self.points + 100
	#   elsif dice.first == 5
	#     self.points + 50
	#   end     
  end
 


end
