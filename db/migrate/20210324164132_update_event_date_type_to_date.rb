class UpdateEventDateTypeToDate < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :event_date, :date
  end
end
