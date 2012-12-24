# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Testy'
    email 'testy@test.com'
    password 'password'
  end
end
