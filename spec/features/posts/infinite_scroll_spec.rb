require 'rails_helper'

RSpec.feature 'Inffinite scroll', :type => :feature do
  Post.per_page = 15

  let(:check_infinite_scroll) do
    expect(page).to have_selector('.single-post-list', count: 15)
    page.execute_script('$(window).scrollTop($(document).height())')
    expect(page).to have_selector('.single-post-list', count: 30)
  end

  scenario 'User scrolls down hobby page and post list
               will be appended with older posts', js: true do
    create_list(:post, 30, category: create(:category, branch: 'hobby'))
    visit hobby_posts_path
    check_infinite_scroll
  end
  scenario 'User scrolls down study page and post list
               will be appended with older posts', js: true do
    create_list(:post, 30, category: create(:category, branch: 'study'))
    visit study_posts_path
    check_infinite_scroll
  end
  scenario 'User scrolls down team page and post list
               will be appended with older posts', js: true do
    create_list(:post, 30, category: create(:category, branch: 'team'))
    visit team_posts_path
    check_infinite_scroll
  end
end