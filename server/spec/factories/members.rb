FactoryBot.define do
  factory :member do
    association :room, factory: :room
    association :user, factory: :agent_user
    name { user.name }
  end
end
