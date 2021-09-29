class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.string :content
      t.references :user, null: false
      t.timestamps
    end
  end
end
