FactoryBot.define do
  factory :message do
    context { "Hello first message." }
    association :room
    association :user, factory: :agent_user
  end
end
