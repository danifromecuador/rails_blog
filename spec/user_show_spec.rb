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