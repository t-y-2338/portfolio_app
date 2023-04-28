FactoryBot.define do
  factory :post do
    title { "MyString" }
    description { "MyText" }
    due_date { "2023-04-28" }
    done_on { "2023-04-28" }
  end
end
