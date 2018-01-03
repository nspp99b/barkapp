class CreateBarks < ActiveRecord::Migration[5.1]
  def change
    create_table :barks do |t|
      t.text :content
      t.integer :user_id
      t.timestamps
    end
    add_index :barks, [:user_id, :created_at]
  end
end
