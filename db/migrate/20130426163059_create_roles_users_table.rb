class CreateRolesUsersTable < ActiveRecord::Migration
  def up
	create_table :roles_users, :id => false do |t|
  		t.references :user
  		t.references :role
  	end
  	add_index :roles_users, [:user_id, :role_id]
  end

  def down
  	drop_table :users_roles
  end

end
