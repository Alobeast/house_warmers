class AddFriendsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :friends, :jsonb
  end
end
