require 'rails_helper'

RSpec.describe 'UsersIndex', type: :system do
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

  #   <div class="post-index">
  #   <div class="user-container">
  #     <img src="<%= @user.photo %>" alt="" class="photo">

  #     <div class="name-posts">
  #       <div class="name">
  #         <%= @user.name %>
  #       </div>
  #       <div class="posts">
  #         <p>Number of posts: <%= @user.posts.count %></p>
  #       </div>
  #     </div>
  #   </div>

  #   <%= link_to "New Post", new_user_post_path(@user), class:"new-post-btn" %>

  #   <div class="posts-container">
  #     <% @posts.each do |post| %>
  #     <div class="post">
  #       <%= link_to user_post_path(post.author, post) do %>
  #         <div class="post-title">
  #           <%= post.title %>
  #         </div>
  #         <div class="post-text">
  #           <%= post.text %>
  #         </div>
  #         <p class="user-posts-post-comments-likes posts"> Comments: <%= post.comments_counter %>, Likes: <%= post.likes_counter %> </p>
  #       <% end %>
  #     </div>
  #       <div class="comments-for-each-post">
  #         <% post.five_most_recent_comments.each do |comment| %>
  #           <p>
  #             <%= comment.user.name %>: <%= comment.text %>
  #           </p>
  #         <% end %>
  #       </div>
  #     <% end %>
  #   </div>
  # </div>

  it 'I can see the user profile picture' do
    tom = User.find_by(name: 'Tom')
    visit user_posts_path(tom)
    expect(page).to have_current_path(user_posts_path(tom))
  end
end
