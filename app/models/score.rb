class Score < ActiveRecord::Base
	has_many :rolls
	belongs_to :game
end
