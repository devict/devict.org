class AddColorToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :color, default: "#ccc"
    end
  end
end
