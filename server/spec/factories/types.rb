FactoryBot.define do
  factory :type_tourist, class: "Type" do
    user_type {"tourist"}
    association :user, factory: :tourist_user
  end
  factory :type_agent, class: "Type" do
    user_type {"agent"}
    association :user, factory: :agent_user
  end
end
