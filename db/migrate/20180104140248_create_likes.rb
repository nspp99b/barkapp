class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :bark_id

      t.timestamps
    end
    add_index :likes, [:user_id, :splain_id], unique: true
  end
end
