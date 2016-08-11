FactoryGirl.define do
  factory :sermon do
    title { Faker::Title.title }
    cites { Faker::Cites.cites }
    sermon_body { Faker::SermonBody.sermon_body }
  end   
end
