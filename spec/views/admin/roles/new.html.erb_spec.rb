require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/roles/new.html.erb" do
  include Admin::RolesHelper
  
  before(:each) do
    @role = mock_model(Role, :name => "test role")
    @role.stub!(:new_record?).and_return(true)
    assigns[:role] = @role
  end

  it "should render new form" do
    render "/admin/roles/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", admin_roles_path) do
    end
  end
end


