require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::RolesController do
  describe "route generation" do

    it "should map { :controller => 'roles', :action => 'index' } to /roles" do
      route_for(:controller => "admin/roles", :action => "index").should == "/admin/roles"
    end
  
    it "should map { :controller => 'roles', :action => 'new' } to /roles/new" do
      route_for(:controller => "admin/roles", :action => "new").should == "/admin/roles/new"
    end
  
    it "should map { :controller => 'roles', :action => 'show', :id => 1 } to /roles/1" do
      route_for(:controller => "admin/roles", :action => "show", :id => 1).should == "/admin/roles/1"
    end
  
    it "should map { :controller => 'roles', :action => 'edit', :id => 1 } to /roles/1/edit" do
      route_for(:controller => "admin/roles", :action => "edit", :id => 1).should == "/admin/roles/1/edit"
    end
  
    it "should map { :controller => 'roles', :action => 'update', :id => 1} to /roles/1" do
      route_for(:controller => "admin/roles", :action => "update", :id => 1).should == "/admin/roles/1"
    end
  
    it "should map { :controller => 'roles', :action => 'destroy', :id => 1} to /roles/1" do
      route_for(:controller => "admin/roles", :action => "destroy", :id => 1).should == "/admin/roles/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'roles', action => 'index' } from GET /roles" do
      params_from(:get, "/admin/roles").should == {:controller => "admin/roles", :action => "index"}
    end
  
    it "should generate params { :controller => 'roles', action => 'new' } from GET /roles/new" do
      params_from(:get, "/admin/roles/new").should == {:controller => "admin/roles", :action => "new"}
    end
  
    it "should generate params { :controller => 'roles', action => 'create' } from POST /roles" do
      params_from(:post, "/admin/roles").should == {:controller => "admin/roles", :action => "create"}
    end
  
    it "should generate params { :controller => 'roles', action => 'show', id => '1' } from GET /roles/1" do
      params_from(:get, "/admin/roles/1").should == {:controller => "admin/roles", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'roles', action => 'edit', id => '1' } from GET /roles/1;edit" do
      params_from(:get, "/admin/roles/1/edit").should == {:controller => "admin/roles", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'roles', action => 'update', id => '1' } from PUT /roles/1" do
      params_from(:put, "/admin/roles/1").should == {:controller => "admin/roles", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'roles', action => 'destroy', id => '1' } from DELETE /roles/1" do
      params_from(:delete, "/admin/roles/1").should == {:controller => "admin/roles", :action => "destroy", :id => "1"}
    end
  end
end