class Game < ActiveRecord::Base
	has_many :scores
	has_many :rolls, through: :scores


    def winner
      array = []
      winner = self.scores[0].points <= self.scores[1].points
      if winner
        [self.scores[1],self.scores[0]]
      else  
        [self.scores[0],self.scores[1]]
      end  
    end	
end
