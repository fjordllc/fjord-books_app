class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.text :title
      t.date :study_date
      t.text :feeling
      t.time :study_start_time
      t.time :study_finish_time
      t.text :report_content

      t.timestamps
    end
  end
end
