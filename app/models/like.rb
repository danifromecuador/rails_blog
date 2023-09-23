class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_post_like_counter

  private

  def update_post_like_counter
    post.update_column(:likes_counter, post.likes.count)
  end
end
