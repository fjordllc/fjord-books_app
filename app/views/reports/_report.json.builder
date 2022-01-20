json.extract! report, :id, :title, :report_content, :created_at, :updated_at
json.url report_url(report, format: :json)
