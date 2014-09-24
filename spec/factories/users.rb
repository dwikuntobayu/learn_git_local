FactoryGirl.define do
  factory :user do
    id "1"
    username "dwikunto"
    email { Faker::Internet.email }
    password "12345"
  end

  factory :invalid_user do
    id "1"
    username nil
    email nil
    password nil
  end
end
