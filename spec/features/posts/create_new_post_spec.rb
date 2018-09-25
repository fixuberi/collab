require 'rails_helper'

RSpec.describe.feature 'Create a new post' do
  let(:user) {create(:user)}
  before(:each) {sign_in user}

  shared_examples 'user create a new post' do |branch|
    scenario 'sucessfully' do
      create(:category, name: 'category', branch: branch)
      visit send("#{branch}_posts_path")
      find('.new-post-button').click

      fill_in 'post[title]', with: 'a' * 20
      fill_in 'post[content]', with: 'a' * 20
      select 'category', from: 'post[category_id]'
      click_on 'Create post'

      expect(page).to have_selector('h3', text: 'a' * 20)
    end
  end

  it_behaves_like 'user create a new post', 'hobby'
  it_behaves_like 'user create a new post', 'study'
  it_behaves_like 'user create a new post', 'team'
end