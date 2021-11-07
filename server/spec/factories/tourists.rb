FactoryBot.define do
  factory :tourist do
    association :type, factory: :type_tourist
    user { type.user }
  end
end
