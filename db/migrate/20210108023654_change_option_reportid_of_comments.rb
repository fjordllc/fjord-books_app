# frozen_string_literal: true

class ChangeOptionReportidOfComments < ActiveRecord::Migration[6.1]
  def up
    change_column :comments, :report_id, :integer, null: true
  end

  def down
    change_column :comments, :report_id, :integer, null: false
  end
end
