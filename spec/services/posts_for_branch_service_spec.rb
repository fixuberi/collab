require 'rails_helper'
require './app/services/posts_for_branch_service'

RSpec.describe PostsForBranchService do

  context '#call' do
    let!(:category) { create(:category, branch: 'hobby', name: 'arts') }
    let(:post) do
      create(:post,
             title: 'fun post',
             category_id: category.id)
    end

    it 'return posts filtered by Branch' do
      included_posts = create_list(:post, 2, category_id: category.id)
      expect(PostsForBranchService.new({branch: category.branch}).call)
          .to(match_array included_posts)
    end
    it 'return  posts filtered by Branch and Search' do
      included_posts = [] << post
      expect(PostsForBranchService.new({branch: category.branch,
                                        search: 'fun'}).call)
          .to eq included_posts
    end
    it 'return posts filtered by Branch and Category name' do
      included_posts = [] << post
      expect(PostsForBranchService.new({branch: category.branch,
                                        category: category.name}).call)
          .to eq included_posts
    end
    it 'return posts filtered by Branch, Search and Category name' do
      included_posts  = [] << post
      expect(PostsForBranchService.new({branch: category.branch,
                                       search: 'fun',
                                       category: category.name}).call)
          .to eq included_posts
    end
  end
end
