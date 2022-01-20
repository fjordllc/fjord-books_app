# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.text :title
      t.text :report_content
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
  end
end
