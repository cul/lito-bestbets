class AddUidIndexToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :uid
  end
end
