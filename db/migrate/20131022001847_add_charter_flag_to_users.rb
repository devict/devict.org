class AddCharterFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :isCharter, :boolean, { default: false }
  end
end
