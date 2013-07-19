class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :challenge_id
      t.integer :user_id
      t.text :code

      t.timestamps
    end
  end
end
