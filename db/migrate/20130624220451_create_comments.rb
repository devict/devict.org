class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :submission
      t.references :user

      t.timestamps
    end
    add_index :comments, :submission_id
    add_index :comments, :user_id
  end
end
