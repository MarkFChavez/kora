FactoryGirl.define do 
  factory :user do
    email { Faker::Internet.email }
    password { 'foobar123' }
  end

  factory :question do
    body { "sample body" }
    user
  end
end
