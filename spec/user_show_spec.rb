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

    FactoryBot.create(
      :post,
      author: User.find_by(name: 'Tom'),
      title: 'Third post by Tom',
      text: 'This is the content of the third post by Tom.'
    )
  end

  it 'I can see the users profile picture' do
    tom = User.find_by(name: 'Tom')
    visit user_path(tom)
    expect(page).to have_css("img[src*='https://picsum.photos/seed/1/200']")
  end

  it 'I can see the users name' do
    tom = User.find_by(name: 'Tom')
    visit user_path(tom)
    expect(page).to have_content('Tom')
  end

  it 'I can see the number of posts the user has written.' do
    tom = User.find_by(name: 'Tom')
    visit user_path(tom)
    expect(page).to have_content('Number of posts: 3')
  end

  it 'I can see the users bio' do
    tom = User.find_by(name: 'Tom')
    visit user_path(tom)
    expect(page).to have_content('An user with a bio.')
  end

  it 'I can see the users first 3 posts' do
    tom = User.find_by(name: 'Tom')
    visit user_path(tom)
    expect(page).to have_content('First Post by Tom')
    expect(page).to have_content('Second post by Tom')
    expect(page).to have_content('Third post by Tom')
  end

  it 'When I click a users post, it redirects me to that posts show page' do
    tom = User.find_by(name: 'Tom')
    visit user_path(tom)
    click_link('First Post by Tom')
    expect(page).to have_current_path(user_post_path(tom, Post.find_by(title: 'First Post by Tom')))
  end

  it 'When I click the see all posts button, it redirects me to the users posts index page' do
    tom = User.find_by(name: 'Tom')
    visit user_path(tom)
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(tom))
  end
end
