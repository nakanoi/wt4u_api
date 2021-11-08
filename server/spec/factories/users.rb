FactoryBot.define do
  factory :user do
    name {"temp_test_user"}
    email {"temp_test_user@example.com"}
    password {"password"}
    password_confirmation {"password"}
  end

  factory :samename, class: "User" do
    name {"temp_test_user"}
    email {"different@example.com"}
    password {"password"}
    password_confirmation {"password"}
  end

  factory :sameemail, class: "User" do
    name {"different_user"}
    email {"temp_test_user@example.com"}
    password {"password"}
    password_confirmation {"password"}
  end

  factory :tourist_user, class: "User" do
    name {"tourist"}
    email {"tourist@example.com"}
    password {"password"}
    password_confirmation {"password"}
  end

  factory :agent_user, class: "User" do
    name {"agent"}
    email {"agent@example.com"}
    password {"password"}
    password_confirmation {"password"}
  end
end
