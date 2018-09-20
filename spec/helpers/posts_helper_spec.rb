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
      posts = []
      expect(helper.no_posts_partial_path(posts)).to eq 'shared/no_posts'
    end
    it 'return empty_partial partial path' do
      posts = [1]
      expect(helper.no_posts_partial_path(posts)).to eq 'shared/empty_partial'
    end
  end

  describe '#post_format_partial_path' do
    it 'return home_page partial path' do
      helper.stub(:current_page?).and_return(true)
      expect(helper.post_format_partial_path).to eq 'posts/post/home_page'
    end
    it 'return branch_page partial path' do
      helper.stub(:current_page?).and_return(false)
      expect(helper.post_format_partial_path).to eq 'posts/post/branch_page'
    end
  end

  describe '#update_pagination_partial_path' do
    it 'return update_pagination partial' do
      posts = double('posts', :next_page => 2)
      assign(:posts, posts)
      expect(helper.update_pagination_partial_path)
          .to eq 'posts/posts_pagination_page/update_pagination'
    end
    it 'return remove_pagination partial' do
      posts = double('posts', :next_page => nil)
      assign(:posts, posts)
      expect(helper.update_pagination_partial_path)
          .to eq 'posts/posts_pagination_page/remove_pagination'
    end
  end
end