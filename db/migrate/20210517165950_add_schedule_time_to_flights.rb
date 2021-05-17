class AddScheduleTimeToFlights < ActiveRecord::Migration[6.1]
  def change
    add_column :flights, :scheduled_time, :datetime
  end
end
