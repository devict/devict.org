class CreateIrcUsers < ActiveRecord::Migration
  def change
    create_table :irc_users do |t|
      t.string :handle
    end
    add_index(:irc_users, :handle)
  end
end
