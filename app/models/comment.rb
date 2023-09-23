class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_post_comment_counter

  private

  def update_post_comment_counter
    post.update_column(:comments_counter, post.comments.count)
  end
end
