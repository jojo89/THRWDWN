require 'spec_helper.rb'
include RequestHelper

describe "The Game Play" do
	it "should have content Your current total is: 0" do
      roll
      expect(page).to have_content("Your current total is: 0")
	end	

	it "should have six images" do
      roll
      page.all(".nonselected").count.should eql(6)
	end		

	it "should have six images" do
	  roll
      first(".nonselected").click
      
	end		




end