json.extract! super_d_upload, :id, :title, :body, :created_at, :updated_at
json.url super_d_upload_url(super_d_upload, format: :json)
