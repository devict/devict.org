class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :url, null: false
      t.belongs_to :user
      t.boolean :approved, default: false

      t.timestamps
    end

    change_table :posts do |t|
      t.references :feed
    end
  end
end
