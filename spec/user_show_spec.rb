require 'rails_helper'

RSpec.describe 'UsersShow', type: :system do
  before do
    FactoryBot.create(
      :user,
      name: 'Tom',
      photo: 'https://picsum.photos/seed/1/200',
      bio: 'An user with a bio.'
    )

    FactoryBot.create(
      :user,
      name: 'Alice',
      photo: 'https://picsum.photos/seed/2/200',
      bio: 'Another user with a different bio.'
    )

    FactoryBot.create(
      :post,
      author: User.find_by(name: 'Tom'),
      title: 'First Post by Tom',
      text: 'This is the content of the first post by Tom.'
    )

    FactoryBot.create(
      :post,
      author: User.find_by(name: 'Tom'),
      title: 'Second post by Tom',
      text: 'This is the content of the second post by Tom.'
    )
  end

#   <ul class="user-index">
#   <% @users.each do |user| %>
#     <li>
#       <%= link_to user_path(user), class:"user-container" do %>
#         <img src="<%= user.photo %>" alt="" class="photo">
#         <div class="name-posts">
#           <div class="name">
#             <%= user.name %>
#           </div>
#           <div class="posts">
#             <p>Number of posts: <%= user.posts.count %></p>
#           </div>
#         </div>
#       <% end %>
#     </li>
#   <% end %>
# </ul>


it 'I can see the users profile picture' do
  # Visit Tom's user profile page using his ID or instance
  tom = User.find_by(name: 'Tom')
  visit user_path(tom)
  expect(page).to have_css("img[src*='https://picsum.photos/seed/1/200']")
end
end
