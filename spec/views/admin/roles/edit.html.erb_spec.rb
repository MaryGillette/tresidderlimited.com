require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/roles/edit.html.erb" do
  include Admin::RolesHelper
  
  before do
    @role = mock_model(Role, :name => "test role")
    assigns[:role] = @role
  end

  it "should render edit form" do
    render "/admin/roles/edit.html.erb"
    
    response.should have_tag("form[action=#{admin_role_path(@role)}][method=post]") do
    end
  end
end


