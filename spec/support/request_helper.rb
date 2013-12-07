module RequestHelper
	
	def go_home
	  visit '/'	
	end	

	def write_names
      go_home
      click_button "Create Game"
	end	

	def start_the_game
      write_names
      fill_in "name1",with:"Dick"
      fill_in "name2",with:"Tracy"
      click_button "Start Game"
	end	

end