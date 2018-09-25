require 'rails_helper'

RSpec.describe 'branches', :type => :request do
  include Warden::Test::Helpers

  shared_examples 'render_templates' do
    it 'render hobby template' do
      get '/posts/hobby'
      expect(response).to render_template(:hobby)
    end
    it 'render study template' do
      get '/posts/study'
      expect(response).to render_template(:study)
    end
    it 'render team template' do
      get '/posts/team'
      expect(response).to render_template(:team)
    end
  end

  context 'for non-signed-in user' do
    it_behaves_like 'render_templates'
  end
  context 'for signed-in user' do
    let(:user) { create(:user) }
    before(':each') { login_as user }

    it_behaves_like 'render_templates'
  end
end