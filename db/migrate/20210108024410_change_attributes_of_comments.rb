# frozen_string_literal: true

class ChangeAttributesOfComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    add_index :comments, %i[commentable_id commentable_type]
    remove_column :comments, :report_id, :integer
  end
end
