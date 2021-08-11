require 'swagger_helper'

RSpec.describe 'api/signups', type: :request do
    path '/signup' do

        post 'Creates a user' do
          consumes 'application/json'
          parameter name: :user, in: :body, schema: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string },
              password_confirmation: { type: :string }
            },
            required: [ 'email', 'password', 'password_confirmation' ]
          }
    
          response '201', 'user created' do
            let(:user) { {"email": "ben@easypep.de", "password": "welcome", "password_confirmation": "welcome"}}
            run_test!
          end
    
          response '422', 'invalid request' do
            let(:user) {{"password": "welcome", "password_confirmation": "welcome"}}
            run_test!
          end

          response '422', 'invalid request' do
            let(:user) {{"email": "ben@easypep.de", "password_confirmation": "welcome"}}
            run_test!
          end

          response '422', 'invalid request' do
            let(:user) {{"email": "ben@easypep.de", "password": "welcome"}}
            run_test!
          end
        end
      end
end
