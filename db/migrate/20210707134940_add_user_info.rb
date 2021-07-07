# frozen_string_literal: true

class AddUserInfo < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :stging # added
    add_column :users, :profile, :text # added
    add_column :users, :zip, :integer # added
    add_column :users, :address, :text # added
  end
end
