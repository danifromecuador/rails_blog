require 'rails_helper'

RSpec.describe '/users/:user_id/posts', type: :request do
  let(:first_user) { User.create(name: 'John', photo: 'https://example.com/john.jpg', bio: 'Some bio') }

  describe 'GET /index' do
    it 'renders a successful response' do
      first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')

      get user_posts_url(first_user)

      expect(response).to be_successful
    end
  end
end
