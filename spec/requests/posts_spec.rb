require 'rails_helper'

RSpec.describe '/users/:user_id/posts', type: :request do
  let(:first_user) { User.create(name: 'John', photo: 'https://example.com/john.jpg', bio: 'Some bio') }

  describe 'GET /index' do
    it 'renders a successful response' do
      get "/users/#{first_user.id}/posts"

      expect(response).to be_successful
    end
  end

  describe 'GET /index' do
    it 'renders an h2 text' do
      get "/users/#{first_user.id}/posts"

      expect(response.body).to include('<h2>List of all posts for a given user</h2>')
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')

      get "/users/#{first_user.id}/posts/#{first_post.id}"

      expect(response).to be_successful
    end
  end
end
