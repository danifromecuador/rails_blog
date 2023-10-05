# spec/requests/comments_spec.rb

require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      user = FactoryBot.create(:user) # Using FactoryBot.create instead of create(:user)
      post = FactoryBot.create(:post, author: user) # Using FactoryBot.create instead of create(:post)
      get new_user_post_comment_path(user, post)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      user = FactoryBot.create(:user) # Using FactoryBot.create instead of create(:user)
      post = FactoryBot.create(:post, author: user) # Using FactoryBot.create instead of create(:post)
      comment_params = { text: 'Test Comment' }
      post user_post_comments_path(user, post), params: { comment: comment_params }
      expect(response).to have_http_status(:redirect)
    end
  end
end
