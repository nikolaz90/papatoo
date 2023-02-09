class AddColumnToLocations < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :end_time, :datetime
  end
end
