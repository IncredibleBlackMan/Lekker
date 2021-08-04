FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "Somereallysecurepassword" }
    password_confirmation { password }
  end
end
