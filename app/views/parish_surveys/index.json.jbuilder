json.array!(@parish_surveys) do |parish_survey|
  json.extract! parish_survey, :id, :title
  json.url parish_survey_url(parish_survey, format: :json)
end
