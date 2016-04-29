json.array!(@syllabuses) do |syllabus|
  json.extract! syllabus, :id, :year, :grade, :I, :II, :III, :IV
  json.url syllabus_url(syllabus, format: :json)
end
