require 'rails_helper'

RSpec.describe 'StatusManagements', type: :request do
  let(:users) { create_list(:user, 2) }
  let(:status_management) { create(:status_management, performer_id: users.first.id, receiver_id: users.last.id)}

  describe 'GET /index' do
    it 'returns http success' do
      auth_token = authenticate_user(users.first)

      get status_managements_path, headers: { 'Authentication' => "Bearer #{auth_token}" }
      expect(response).to have_http_status(:success)
    end
  end
end
