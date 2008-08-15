require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::Role do
  before(:each) do
    @role = Admin::Role.new
  end

  it "should be valid" do
    @role.should be_valid
  end
end
