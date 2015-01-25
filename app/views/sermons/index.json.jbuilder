json.array!(@sermons) do |sermon|
  json.extract! sermon, :id, :homilist, :title, :cites, :delivered_on, :sermon
  json.url sermon_url(sermon, format: :json)
end
