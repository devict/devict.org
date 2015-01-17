class DropUnusedTables < ActiveRecord::Migration
  def up
    drop_table :users
    drop_table :challenges
    drop_table :comments
    drop_table :feeds
    drop_table :irc_users
    drop_table :posts
    drop_table :services
    drop_table :submissions
  end

  def down
  end
end
