json.extract! job, :id, :title, :description, :location, :mode, :requirements, :skills, :benefits, :salary, :employer_id, :created_at, :updated_at
json.url job_url(job, format: :json)
