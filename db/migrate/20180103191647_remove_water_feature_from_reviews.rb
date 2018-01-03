class RemoveWaterFeatureFromReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :water_feature, :boolean
  end
end
