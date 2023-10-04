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

    FactoryBot.create(
      :post,
      author: User.find_by(name: 'Tom'),
      title: 'Third post by Tom',
      text: 'This is the content of the third post by Tom.'
    )

    FactoryBot.create(
      :comment,
      post: Post.find_by(title: 'First Post by Tom'),
      user: User.find_by(name: 'Tom'),
      text: 'This is the first comment on the first post by Tom.'
    )
  end

  it 'I can see the user profile picture' do
    tom = User.find_by(name: 'Tom')
    visit user_posts_path(tom)
    expect(page).to have_current_path(user_posts_path(tom))
  end

  it 'I can see the user name' do
    tom = User.find_by(name: 'Tom')
    visit user_posts_path(tom)
    expect(page).to have_content('Tom')
  end

  it 'I can see the number of posts the user has written.' do
    tom = User.find_by(name: 'Tom')
    visit user_posts_path(tom)
    expect(page).to have_content('Number of posts: 3')
  end

  it 'I can see a post title' do
    tom = User.find_by(name: 'Tom')
    visit user_posts_path(tom)
    expect(page).to have_content('First Post by Tom')
  end

  it 'I can see some of the post body' do
    tom = User.find_by(name: 'Tom')
    visit user_posts_path(tom)
    expect(page).to have_content('This is the content of the first post by Tom.')
  end

  it 'I can see the first comments on a post' do
    tom = User.find_by(name: 'Tom')
    visit user_posts_path(tom)
    expect(page).to have_content('This is the first comment on the first post by Tom.')
  end

  it 'I can see how many comments a post has' do
    tom = User.find_by(name: 'Tom')
    visit user_posts_path(tom)
    expect(page).to have_content('Comments: 1')
  end

  it 'I can see how many likes a post has' do
    tom = User.find_by(name: 'Tom')
    visit user_posts_path(tom)
    expect(page).to have_content('Likes: 0')
  end

  it 'When I click on a post, it redirects me to that post show page' do
    tom = User.find_by(name: 'Tom')
    visit user_posts_path(tom)
    click_link('First Post by Tom')
    expect(page).to have_current_path(user_post_path(tom, Post.find_by(title: 'First Post by Tom')))
  end
end
