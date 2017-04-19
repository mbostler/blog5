json.extract! photo, :id, :title, :album_id, :description, :order, :created_at, :updated_at
json.url photo_url(photo, format: :json)
