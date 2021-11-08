FactoryBot.define do
  factory :agent do
    association :type, factory: :type_agent
    user { type.user }
    area { "札幌" }
    business { "宿泊" }
  end
end
