require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin_roles/edit.html.erb" do
  include Admin::RolesHelper
  
  before do
    @role = mock_model(Admin::Role)
    assigns[:role] = @role
  end

  it "should render edit form" do
    render "/admin_roles/edit.html.erb"
    
    response.should have_tag("form[action=#{role_path(@role)}][method=post]") do
    end
  end
end


