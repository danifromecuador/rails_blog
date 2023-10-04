FactoryBot.define do
  factory :post do
    author { association(:user) }
    title { 'title' }
    text { 'text' }
  end
end
