require 'rails_helper'

RSpec.describe Category, :type => :model do
  context 'associations' do
    it 'has many posts' do
      association = described_class.reflect_on_association(:posts)
      expect(association.macro).to eq :has_many
    end
  end
end