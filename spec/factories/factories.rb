FactoryGirl.define do 
  factory :user do
    email { Faker::Internet.email }
    password { 'foobar123' }
  end

  factory :question do
    body { "sample body" }
    user
  end

  factory :answer do
    body { "great question!" }
    user
    question
  end
end
