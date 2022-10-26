require 'rails_helper'

RSpec.describe "SharedLists", type: :request do
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get shared_lists_path
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_shared_list_url
      expect(response).to render_template(:new)
    end
  end
end
