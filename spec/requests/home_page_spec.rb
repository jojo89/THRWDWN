require 'spec_helper.rb'
include RequestHelper

describe "Home_Page" do

	it "Should have content Hot Dice" do
      go_home
      expect(page).to have_content("Hot Dice")
	end	

	it "should have content 1000" do
	  go_home
      expect(page).to have_content("1000")
    end	

    it "should have content 2000" do
	  go_home
      expect(page).to have_content("2000")
    end

    

	
end