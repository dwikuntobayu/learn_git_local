FactoryGirl.define do
  factory :article do
    id "1"
    title { Faker::Name.title }
    content { Faker::Lorem.paragraph }
    status "active"
  end

  factory :invalid_article do
    title { Faker::Name.title }
    content nil
    status nil
  end
end
