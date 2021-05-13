class AddLocationNameToAirports < ActiveRecord::Migration[6.1]
  def change
    add_column :airports, :location_name, :string
  end
end
