require 'rails_helper'

RSpec.describe '/users/:user_id/posts', type: :request do
  let(:first_user) { User.create(name: 'John', photo: 'https://example.com/john.jpg', bio: 'Some bio') }

  describe 'GET /index' do
    it 'response status is successful' do
      get "/users/#{first_user.id}/posts"
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get "/users/#{first_user.id}/posts"
      expect(response).to render_template('posts/index')
    end

    it 'renders the right placeholder text' do
      get "/users/#{first_user.id}/posts"
      expect(response.body).to include('<h2>List of all posts for a given user</h2>')
    end
  end
end
