json.extract! feedback, :id, :message, :email, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
