class Roll < ActiveRecord::Base
    belongs_to :score
    has_one :game, through: :score
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
  self.hot_dice ||=0
end  




  def count_up(array)
    array = array.collect{|s| s.to_i}
    freq = array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    array = array.sort_by { |v| freq[v] }
    if array.last(3) == [1,1,1]
      p self.points
      self.points = self.points + 1000
      p self.points
      array.pop(3)
      self.dice_left = self.dice_left - 3
      self.hot_dice = self.hot_dice + 3
      count_up(array)
    elsif array.last(3) == [2,2,2]
      self.points = self.points + 200
      array.pop(3)
      self.dice_left = self.dice_left - 3
      self.hot_dice = self.hot_dice + 3
      count_up(array)
    elsif array.last(3) == [3,3,3]
      self.points = self.points + 300
      array.pop(3)
      self.dice_left = self.dice_left - 3
      self.hot_dice = self.hot_dice + 3
      count_up(array)
    elsif array.last(3) == [4,4,4]
      self.points = self.points + 400
      array.pop(3)
      self.dice_left = self.dice_left - 3
      self.hot_dice = self.hot_dice + 3
      count_up(array)
    elsif array.last(3) == [5,5,5]
      self.points = self.points + 500
      array.pop(3)
      self.dice_left = self.dice_left - 3
      self.hot_dice = self.hot_dice + 3
      count_up(array)
    elsif array.last(3) == [6,6,6]
      self.points = self.points + 600
      array.pop(3)
      self.dice_left = self.dice_left - 3
      self.hot_dice = self.hot_dice + 3
      count_up(array)
    else 
      if array != []	
        array.each do |x|
          self.dice_left = self.dice_left - 1
          if x == 5
    	    self.points = self.points +  50
    	    self.hot_dice = self.hot_dice + 1
    	  elsif x == 1
    	    self.points = self.points +  100
    	    self.hot_dice = self.hot_dice + 1
        else 
          @remainder =true  
    	  end
        end 
      end    	    
    end 
    if self.hot_dice == 6
        self.dice_left = 6	
        self.hot_dice = 0
    end
    if @remainder == true
      p @remainder
    else
      self.save
      self.points
    end  
    self.points

  end	

 


end
