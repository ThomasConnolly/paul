json.array!(@story_ideas) do |story_idea|
  json.extract! story_idea, :id, :title, :body
  json.url story_idea_url(story_idea, format: :json)
end
