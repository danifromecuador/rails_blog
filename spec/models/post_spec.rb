require 'rails_helper'

RSpec.describe Post, type: :model do
    let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

    subject { Post.new(author: user, title: 'This is a new post.', text: 'This is the body of the post') }

    before { subject.save }

    it 'it has a title' do
        expect(subject.title).to eq('This is a new post.')
    end
end
