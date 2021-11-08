FactoryBot.define do
  factory :request do
    title { "Sample Request from Tourist" }
    area { "札幌" }
    cost { 50000 }
    number { 2 }
    date { "2022-8-20"  }
    days { 2}
    genre { "自然観光" }
    range { 50 }
    context { "This is just a sample post." }
    status { true }
    association :user, factory: :tourist_user
    name { user.name }
  end
end
