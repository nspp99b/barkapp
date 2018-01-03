class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :overall
      t.integer :energy_level
      t.integer :facilities
      t.integer :scene
      t.boolean :water_feature
      t.text :content
      t.references :park, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
