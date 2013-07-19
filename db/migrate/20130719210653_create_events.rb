class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :venue_name
      t.string :venue_address
      t.string :venue_city
      t.string :venue_state
      t.string :venue_zip
      t.string :date
      t.string :url
      t.string :photo_url

      t.timestamps
    end
  end
end
