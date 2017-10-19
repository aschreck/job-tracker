require 'rails_helper'

describe "User creates a new category" do
	it "a user can create a new category" do
		visit new_categor_path

		fill_in "category[name]", with: "ESPN"
		click_button "Create"
  end 
end 

