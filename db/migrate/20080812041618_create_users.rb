class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :login,                     :string, :limit => 40
      t.column :name,                      :string, :limit => 100, :default => '', :null => true
      t.column :email,                     :string, :limit => 100
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :remember_token,            :string, :limit => 40
      t.column :remember_token_expires_at, :datetime
      t.column :activation_code,           :string, :limit => 40
      t.column :reset_code,                :string, :limit => 40      
      t.column :activated_at,              :datetime
      t.column :state,                     :string, :null => :no, :default => 'passive'
      t.column :deleted_at,                :datetime
      t.timestamps
      t.userstamps
    end
    add_index :users, :login, :unique => true
    execute "INSERT into users (login, email, crypted_password, salt, activated_at, state) values ('admin', 'admin@example.com', 'ad3ca7d2848dc04cccac856f3baee816019219f4', 'ccddfcbe6e0bb54c9ba988b74064c71721faf438',now(),'active');"
  end

  def self.down
    drop_table "users"
  end
end
