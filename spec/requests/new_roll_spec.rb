require 'spec_helper.rb'
include RequestHelper

  describe "New Roll Page" do 
  	it "should have the name Dick" do
  	  start_the_game
  	  expect(page).to have_content("Dick")
  	end  


  end