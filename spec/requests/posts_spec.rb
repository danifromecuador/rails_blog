require 'rails_helper'

RSpec.describe '/users/:user_id/posts', type: :request do
  let(:first_user) { User.create(name: 'John', photo: 'https://example.com/john.jpg', bio: 'Some bio') }
  let(:first_post) { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }

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

  describe 'GET /show' do
    it 'response status is successful' do  
      get "/users/#{first_user.id}/posts/#{first_post.id}"  
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get "/users/#{first_user.id}/posts/#{first_post.id}"
      puts "Route: #{request.fullpath}"
      expect(response).to render_template('posts/show')
    end

    it 'renders the right placeholder text' do
      get "/users/#{first_user.id}/posts/#{first_post.id}"
      expect(response.body).to include('<h2>Details of a given post of a given user</h2>')
    end
  end
end



