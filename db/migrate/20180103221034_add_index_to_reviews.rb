class AddIndexToReviews < ActiveRecord::Migration[5.1]
  def change
    add_index :reviews, :created_at
  end
end
