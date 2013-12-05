require 'spec_helper.rb'

describe "Home_Page" do

	it "Should have content Hot Dice" do
      visit '/'
      expect(page).to have_content("Hot Dice")
	end	

	it "should have content 1000" do
	  visit '/'
      expect(page).to have_content("1000")
    end
	
end