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

  it 'shows the username of all users' do
    visit users_path
    sleep(2)
    expect(page).to have_content('Tom')
    expect(page).to have_content('Alice')

    # Check if posts by users are displayed
    # expect(page).to have_content('First Post by Tom')
    # expect(page).to have_content('First Post by Alice')
    # expect(page).to have_content('First Post by Bob')
  end

  it 'shows the profile picture for each user' do
    visit users_path
    sleep(2)
    expect(page).to have_selector("img[src='https://picsum.photos/seed/1/200']")
    expect(page).to have_selector("img[src='https://picsum.photos/seed/2/200']")
  end
end
