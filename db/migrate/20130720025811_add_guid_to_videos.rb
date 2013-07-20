class AddGuidToVideos < ActiveRecord::Migration
  def change
    Video.delete_all
    add_column :videos, :guid, :string
  end
end
