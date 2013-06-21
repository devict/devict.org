class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :content
      t.text :link
      t.timestamp :published_at

      t.timestamps
    end
  end
end
