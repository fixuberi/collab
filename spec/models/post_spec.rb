require 'rails_helper'

RSpec.describe Post, :type => :model do
  context 'associations' do
    it 'belongs to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
    it 'belongs to category' do
      association = described_class.reflect_on_association(:category)
      expect(association.macro).to eq :belongs_to
    end
  end

  context 'scopes'do
    context 'default scope' do
      let!(:first_post) { create(:post) }
      let!(:second_post) { create(:post) }

      it 'return posts in descending order by create date' do
        expect(Post.all).to eq [second_post, first_post]
      end
    end
  end
end