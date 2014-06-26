require 'spec_helper'

describe Question do
  it "should verify presence of title" do
    should validate_presence_of(:title)
  end

  it "should verify presence of content" do
    should validate_presence_of(:content)
  end

  it "should verify presence of author" do
    should validate_presence_of(:user_id)
  end

  it "should verify presence of category" do
    should validate_presence_of(:category_id)
  end
end
