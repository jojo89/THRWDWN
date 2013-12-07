class Game < ActiveRecord::Base
	has_many :scores
	has_many :rolls, through: :scores


    def winner
      array = []
      self.scores.each do |s|
        if s.points > array.first.points
          array << s 
        end	
      end	
    end	

end
