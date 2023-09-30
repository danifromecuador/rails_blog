FactoryBot.define do
  factory :post do
    title { 'Example Post' }
    text { 'This is an example post.' }
    author { association(:user) } # Associate the post with a user using the :user factory
    # Add any other attributes you need for the Post model
  end
end