json.extract! report, :id, :title, :description, :category, :status, :published_on, :user_id, :created_at, :updated_at
json.url report_url(report, format: :json)
