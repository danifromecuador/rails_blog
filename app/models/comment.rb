class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :post

  after_save :update_post_comment_counter

  private

  def update_post_comment_counter
    post.increment!(:comments_counter)
  end
end
