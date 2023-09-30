require 'rails_helper'

RSpec.describe '/users', type: :request do
  let(:first_user) { User.create(name: 'John', photo: 'https://example.com/john.jpg', bio: 'Some bio') }

  describe 'GET /index' do
    it 'response status is successful' do
      get '/users'
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get '/users'
      expect(response).to render_template('users/index')
    end

    it 'renders the right placeholder text' do
      get '/users'
      expect(response.body).to include('<ul class="user-index">')
    end
  end

  describe 'GET /show' do
    it 'response status is successful' do
      get "/users/#{first_user.id}"
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get "/users/#{first_user.id}"
      puts "Route: #{request.fullpath}"
      expect(response).to render_template('users/show')
    end

    it 'renders the right placeholder text' do
      get "/users/#{first_user.id}"
      expect(response.body).to include('<div class="user-index">')
    end
  end
end
