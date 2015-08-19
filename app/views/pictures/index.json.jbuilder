json.array!(@pictures) do |picture|
  json.extract! picture, :id, :album_id, :user_id, :caption
  json.url picture_url(picture, format: :json)
end
