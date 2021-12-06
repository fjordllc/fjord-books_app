# frozen_string_literal: true

class CreateUserfollows < ActiveRecord::Migration[6.1]
  def change
    create_table :userfollows do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps null: false
    end

    add_index :userfollows, :follower_id
    add_index :userfollows, :following_id
    add_index :userfollows, %i[follower_id following_id], unique: true
  end
end
