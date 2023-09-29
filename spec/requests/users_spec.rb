require 'rails_helper'

RSpec.describe '/users', type: :request do
  let(:valid_attributes) do
    {
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.'
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      User.create! valid_attributes
      get users_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      user = User.create! valid_attributes
      get user_url(user)
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      user = User.create! valid_attributes
      get user_url(user)
      expect(response).to be_successful
      expect(response.body).to include('<h2>Details of a given user</h2>')
    end
  end
end
