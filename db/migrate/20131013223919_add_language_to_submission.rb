class AddLanguageToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :language, :string, { null: false, default: 'Other' }
  end
end
