FactoryBot.define do
  factory :comment do
    association :post
    association :user
    text { 'text' }
  end
end
