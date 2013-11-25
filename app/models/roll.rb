class Roll < ActiveRecord::Base
    belongs_to :score
    has_one :game, through: :score
	has_one :user, through: :score
    before_save :set_values

def throw_dice
  score =[]
  self.dice_left.times do 
  	score << rand(1..6)
  end	
  score
end	


def set_values
  self.dice_left ||= 6
  self.points ||= 0
end  




  def score(array)
    freq = array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    array = array.sort_by { |v| freq[v] }
    starting_points = self.points
    if array.last(3) == [1,1,1]
      self.points = self.points + 1000
      array.pop(3)
      self.dice_left = self.dice_left - 3
      score(array)
    elsif array.last(3) == [2,2,2]
      self.points = self.points + 200
      array.pop(3)
      self.dice_left = self.dice_left - 3
      score(array)
    elsif array.last(3) == [3,3,3]
      self.points = self.points + 300
      array.pop(3)
      self.dice_left = self.dice_left - 3
      score(array)
    elsif array.last(3) == [4,4,4]
      self.points = self.points + 400
      array.pop(3)
      self.dice_left = self.dice_left - 3
      score(array)
    elsif array.last(3) == [5,5,5]
      self.points = self.points + 500
      array.pop(3)
      self.dice_left = self.dice_left - 3
      score(array)
    elsif array.last(3) == [6,6,6]
      self.points = self.points + 600
      array.pop(3)
      self.dice_left = self.dice_left - 3
      score(array)
    else 
      if array != []	
        array.each do |x|
          self.dice_left = self.dice_left - 1
          if x == 5
    	    self.points = self.points +  50
    	  elsif x == 1
    	    self.points = self.points +  100
    	  end
        end 
      end    	    
    end 
    if starting_points == self.points 
    	self.points = 0
    end
    self.save
    self.points
  end	

 


end
