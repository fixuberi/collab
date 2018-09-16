require 'rails_helper'

RSpec.describe PostsHelper, :type => :helper do
  describe '#create_new_post_partial_path' do
    it 'return signed_in partial path' do
      helper.stub(:user_signed_in?).and_return(true)
      expect(helper.create_new_post_partial_path).to eq 'posts/branch/create_new_post/signed_in'
    end
    it 'returns not_signed_in partial path' do
      helper.stub(:user_signed_in?).and_return(false)
      expect(helper.create_new_post_partial_path).to eq 'posts/branch/create_new_post/not_signed_in'
    end

  end
  describe '#all_categories_button_partial_path' do
    it 'return all_selected partial path' do
      controller.params[:category] = ''
      expect(helper.all_categories_button_partial_path).to eq 'posts/branch/categories/all_selected'
    end
    it 'return all_not_selected partial path' do
      controller.params[:category] = 'category'
      expect(helper.all_categories_button_partial_path).to eq 'posts/branch/categories/all_not_selected'
    end
  end
  describe '#no_posts_partial_path' do
    it 'returns no_posts partial path' do
      assign(:posts, [])
      expect(helper.no_posts_partial_path).to eq 'posts/branch/no_posts'
    end
    it 'return empty_partial partial path' do
      assign(:posts, [1])
      expect(helper.no_posts_partial_path).to eq 'shared/empty_partial'
    end
  end
end