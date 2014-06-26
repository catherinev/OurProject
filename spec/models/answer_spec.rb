require 'spec_helper'

describe Answer do 
	  it "should verify presence of question_id" do
    should validate_presence_of(:question_id)
  end

  it "should verify presence of content" do
    should validate_presence_of(:content)
  end

  it "should verify presence of author" do
    should validate_presence_of(:user_id)
  end

  it "should belong to a user" do
  	should belong_to(:user)
  end

  it "should belong to a question" do
  	should belong_to(:question)
  end

  it "should have many comments" do
  	should have_many(:comments)
  end

end
