require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'it has a name' do
    expect(subject.name).to eq('Tom')
  end

  it 'three_most_recent_posts' do
    expect(subject.three_most_recent_posts).to eq([])
  end

  it 'post_counter' do
    expect(subject.post_counter).to eq(nil)
  end
end
