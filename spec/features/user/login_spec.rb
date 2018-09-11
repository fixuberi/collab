require 'rails_helper'

RSpec.feature 'Login', :type  => :feature, js: true do
  let!(:user) { create(:user) }

  scenario 'user navigates to the root page and successfully logs in' do
    visit root_path
    find('nav a', text:'Login').click
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find('.login-button').click

    expect(page).to have_selector('#user-settings')
  end
end