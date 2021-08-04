require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:users) { create_list(:user, 2) }

  describe 'GET /index' do
    it 'returns http success' do
      auth_token = authenticate_user(users.first)

      get users_path, headers: { 'Authentication' => "Bearer #{auth_token}" }
      expect(response).to have_http_status(:success)
    end

    it 'returns please login' do
      get users_path
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'PUT /:id/archive' do
    it 'returns http success on archiving' do
      auth_token = authenticate_user(users.first)

      archive_url = `/#{users.last.id}/archive`
      put archive_url, headers: { 'Authentication' => "Bearer #{auth_token}" }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT /:id/unarchive' do
    it 'returns http success on unarchiving' do
      auth_token = authenticate_user(users.first)

      unarchive_url = `/#{users.last.id}/unarchive`
      put unarchive_url, headers: { 'Authentication' => "Bearer #{auth_token}" }
      expect(response).to have_http_status(:success)
    end
  end


end
