class LinkUsersToComments < ActiveRecord::Migration
  def change
  	remove_column :comments, :user_name, :string
  	add_column :comments, :user_id, :integer
  end
end
