require 'rails_helper'


RSpec.describe "new", :type => :request do
  include Warden::Test::Helpers

  context 'non-signed-in user' do
    it 'redirect to root_path' do
      get '/posts/new'
      expect(response).to redirect_to(root_path)
    end
  end

  context 'for signed-in user' do
    let(:user) { create(:user) }
    before(:each) { login_as user }

    it 'render #new template' do
      get '/posts/new'
      expect(response).to render_template(:new)
    end
  end
end