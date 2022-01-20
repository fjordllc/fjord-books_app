# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :commentable, polymophic: true, null: false
      t.string :commentable_type, null: false
      t.text :comment_content
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
  end
end
