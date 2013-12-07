require 'spec_helper.rb'
include RequestHelper

describe "new scores page" do

	its "should have content Player 1" do
		write_names
		expect(page).to have_content("Player 1")
	end

	its "should have content Player 2" do
		write_names
		expect(page).to have_content("Player 1")
	end	

	
	
end