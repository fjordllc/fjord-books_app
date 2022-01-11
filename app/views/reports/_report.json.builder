json.extract! report, :id, :title, :study_date, :feeling, :study_start_time, :study_finish_time, :report_content, :created_at, :updated_at
json.url book_url(report, format: :json)
