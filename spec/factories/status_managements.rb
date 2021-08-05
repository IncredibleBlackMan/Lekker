FactoryBot.define do
  factory :status_management do
    performer_id { 1 }
    receiver_id { 2 }
    action { 'active' }

    association :user
  end
end
