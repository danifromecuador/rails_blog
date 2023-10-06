class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :user_id
  has_many :likes, foreign_key: :liker_id
  attribute :post_counter, :integer, default: 0 

  validates :name, presence: true
  validates :post_counter, numericality: { greater_than_or_equal_to: 0 }

  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end