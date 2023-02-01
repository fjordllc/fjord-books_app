class RenameBodyColumnToComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :body, :content
  end
end
