class AddEmailsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :emails, :string
  end
end
