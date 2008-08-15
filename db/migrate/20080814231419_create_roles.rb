class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table "roles" do |t|
      t.string :name
    end
    
    # generate the join table
    create_table "roles_users", :id => false do |t|
      t.integer "role_id", "user_id"
    end
    add_index "roles_users", "role_id"
    add_index "roles_users", "user_id"
  end

  # superuser first user and add other roles
  execute "INSERT into roles (name) values ('superuser');"
  execute "INSERT into roles (name) values ('administrator');"
  execute "INSERT into roles (name) values ('member');"
  execute "INSERT into roles (name) values ('employee');"

  # roles for dinshaw
  execute "INSERT into roles_users (user_id, role_id) values ('1','1');"
  execute "INSERT into roles_users (user_id, role_id) values ('1','2');"
  execute "INSERT into roles_users (user_id, role_id) values ('1','3');"

  def self.down
    drop_table "roles"
    drop_table "roles_users"
  end
end