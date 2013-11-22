class Score < ActiveRecord::Base
	has_many :rolls
	belongs_to :user
	belongs_to :game
end
