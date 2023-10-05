require 'rails_helper'

RSpec.describe 'PostShow', type: :system do
  before do
    FactoryBot.create(
      :user, name: 'Tom', photo: 'https://picsum.photos/seed/1/200', bio: 'An user with a bio.'
    )

    FactoryBot.create(
      :user, name: 'Jerry', photo: 'https://picsum.photos/seed/2/200', bio: 'An user with a bio.'
    )

    FactoryBot.create(
      :post,
      author: User.find_by(name: 'Tom'), title: 'First Post by Tom', text: 'This is the content of the 1st post by Tom.'
    )

    FactoryBot.create(
      :comment, post: Post.find_by(title: 'First Post by Tom'), user: User.find_by(name: 'Tom'),
                text: 'This is the first comment on the first post by Tom.'
    )

    FactoryBot.create(
      :comment, post: Post.find_by(title: 'First Post by Tom'), user: User.find_by(name: 'Tom'),
                text: 'This is the second comment on the first post by Tom.'
    )

    FactoryBot.create(
      :comment, post: Post.find_by(title: 'First Post by Tom'), user: User.find_by(name: 'Tom'),
                text: 'This is the third comment on the first post by Tom.'
    )

    FactoryBot.create(
      :comment, post: Post.find_by(title: 'First Post by Tom'), user: User.find_by(name: 'Jerry'),
                text: 'This is the first comment on the first post by Jerry.'
    )
  end

  it 'I can see the post title' do
    tom = User.find_by(name: 'Tom')
    post = Post.find_by(title: 'First Post by Tom')
    visit user_post_path(tom, post)
    expect(page).to have_content('First Post by Tom')
  end

  it 'I can see who wrote the post' do
    tom = User.find_by(name: 'Tom')
    post = Post.find_by(title: 'First Post by Tom')
    visit user_post_path(tom, post)
    expect(page).to have_content('Tom')
  end

  it 'I can see how many comments it has' do
    tom = User.find_by(name: 'Tom')
    post = Post.find_by(title: 'First Post by Tom')
    visit user_post_path(tom, post)
    expect(page).to have_content('Comments: 4')
  end

  it 'I can see how many likes it has' do
    tom = User.find_by(name: 'Tom')
    post = Post.find_by(title: 'First Post by Tom')
    visit user_post_path(tom, post)
    expect(page).to have_content('Likes: 0')
  end

  it 'I can see the post body' do
    tom = User.find_by(name: 'Tom')
    post = Post.find_by(title: 'First Post by Tom')
    visit user_post_path(tom, post)
    expect(page).to have_content('This is the content of the 1st post by Tom.')
  end

  it 'I can see the username of each commentor' do
    tom = User.find_by(name: 'Tom')
    post = Post.find_by(title: 'First Post by Tom')
    visit user_post_path(tom, post)
    expect(page).to have_content('Jerry')
  end

  it 'I can see the text of each comment' do
    tom = User.find_by(name: 'Tom')
    post = Post.find_by(title: 'First Post by Tom')
    visit user_post_path(tom, post)
    expect(page).to have_content('This is the first comment on the first post by Tom.')
  end
end
