FactoryGirl.define do
  factory :survey_answer do
    answer_options "MyText"
    comment "MyText"
    survey_question nil
  end
end
