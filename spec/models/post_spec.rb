require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  subject { Post.new(author: user, title: 'This is a new post.', text: 'This is the body of the post') }

  before { subject.save }

  it 'it has a title' do
    expect(subject.title).to eq('This is a new post.')
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid with a blank title' do
    subject.title = ''
    expect(subject).not_to be_valid
  end

  it 'is not valid with a title exceeding 250 characters' do
    subject.title = 'a' * 251 # This exceeds the 250 character limit
    expect(subject).not_to be_valid
  end

  it 'is not valid with comments_counter as a negative integer' do
    subject.comments_counter = -1
    expect(subject).not_to be_valid
  end

  it 'is not valid with likes_counter as a negative integer' do
    subject.likes_counter = -1
    expect(subject).not_to be_valid
  end
end
