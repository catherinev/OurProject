require 'spec_helper'

describe User do 
	it "should validate the presence of a username" do
		should validate_presence_of(:username)
	end

	it "should validate the presence of an email" do
		should validate_presence_of(:email)
	end	

	it "should validate the presence of a password_digest" do
		should validate_presence_of(:password_digest)
	end

	it "should validate the uniqueness of an email" do
		should validate_uniqueness_of(:email)
	end

	it "should have many questions" do
		should have_many(:questions)
	end

	it "should have many answers" do
		should have_many(:answers)
	end

	it "should have many comments" do
		should have_many(:comments)
	end

end