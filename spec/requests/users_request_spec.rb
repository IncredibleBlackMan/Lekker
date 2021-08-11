require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:users) { create_list(:user, 2) }
  let(:archived_user) { create(:user, status: 'archived') }

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

      archive_url = "/users/#{users.last.id}/archive"
      put archive_url, headers: { 'Authentication' => "Bearer #{auth_token}" }
      expect(response).to have_http_status(:success)
    end

    it 'returns http unauthorized on unarchiving' do
      # trying to archive oneself
      auth_token = authenticate_user(users.first)

      archive_url = "/users/#{users.first.id}/archive"
      put archive_url, headers: { 'Authentication' => "Bearer #{auth_token}" }

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'PUT /:id/unarchive' do
    it 'returns http success on unarchiving' do
      auth_token = authenticate_user(users.first)

      unarchive_url = "/users/#{archived_user.id}/unarchive"
      put unarchive_url, headers: { 'Authentication' => "Bearer #{auth_token}" }

      expect(response).to have_http_status(:success)
    end

    it 'returns http unauthorized on unarchiving' do
      # trying to unarchive oneself
      auth_token = authenticate_user(users.first)

      archive_url = "/users/#{users.first.id}/unarchive"
      put archive_url, headers: { 'Authentication' => "Bearer #{auth_token}" }

      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns http unprocessable entity on unarchiving' do
      # trying to unarchive an active user
      auth_token = authenticate_user(users.first)

      unarchive_url = "/users/#{users.last.id}/unarchive"
      put unarchive_url, headers: { 'Authentication' => "Bearer #{auth_token}" }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET filter users' do
    it 'returns http success' do
      auth_token = authenticate_user(users.first)

      get users_path, params: { status: ['active'] }, headers: { 'Authentication' => "Bearer #{auth_token}" }

      result = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(result['data'].length).to eq 2
    end
  end


end
