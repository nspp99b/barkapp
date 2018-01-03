class RemoveWaterFeatureFromParks < ActiveRecord::Migration[5.1]
  def change
    remove_column :parks, :water_feature, :boolean
  end
end
