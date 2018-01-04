class UpdateIndexFromLikes < ActiveRecord::Migration[5.1]
  def change
    remove_index :likes, [:user_id, nil]
    add_index :likes, [:user_id, :bark_id], unique: true
  end
end
