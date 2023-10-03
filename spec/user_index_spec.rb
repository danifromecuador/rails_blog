require 'rails_helper'

RSpec.describe 'UsersIndex', type: :system do
  before do
    # Create some users in the test database using FactoryBot.
    # This will ensure that there are users to display on the index page.
    FactoryBot.create(:user, name: 'User 1')
    FactoryBot.create(:user, name: 'User 2')
  end

  it 'shows the right content' do
    visit users_path
    # Use the 'expect' method to check if the page has the content "Users"
    # expect(page).to have_content('Users')

    # You can also check if the user names you created earlier are displayed.
    expect(page).to have_content('User 1')
    expect(page).to have_content('User 2')
  end
end
