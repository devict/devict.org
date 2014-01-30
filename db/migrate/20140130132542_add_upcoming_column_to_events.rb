class AddUpcomingColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :upcoming, :boolean, default: 0
  end
end
