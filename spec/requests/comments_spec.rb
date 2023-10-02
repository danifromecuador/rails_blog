# spec/requests/comments_spec.rb

require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      user = create(:user) # Create a user
      post = create(:post, author: user) # Create a post associated with the user
      get new_user_post_comment_path(user, post)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      user = create(:user) # Create a user
      post = create(:post, author: user) # Create a post associated with the user
      comment_params = { text: 'Test Comment' }
      post user_post_comments_path(user, post), params: { comment: comment_params }
      expect(response).to have_http_status(:redirect) # Assuming it redirects on success
    end
  end
end
