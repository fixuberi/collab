require 'rails_helper'

RSpec.describe 'show', :type => :request do
  include Warden::Test::Helpers
  shared_examples 'render_show_template' do
    let(:post) { create(:post) }
    it 'render show template' do
      get post_path(post)
      expect(response).to render_template(:show)
    end
  end

  context 'for non-loged-in user' do
    it_behaves_like 'render_show_template'
  end
  context 'for loged-in user' do
    let(:user) { create(:user) }
    before(:each) { login_as user }

    it_behaves_like 'render_show_template'
  end
end