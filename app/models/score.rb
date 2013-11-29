class Score < ActiveRecord::Base
	has_many :rolls
	belongs_to :game
	before_save :set_values

end

def set_values
  self.points ||= 0
end  
