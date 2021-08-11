require 'swagger_helper'

RSpec.describe 'api/authentications', type: :request do
    path '/authentications' do

        post 'Creates a user' do
          consumes 'application/json'
          parameter name: :authentication, in: :body, schema: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            },
            required: [ 'email', 'password' ]
          }
    
          response '200', 'authenticates a user' do
            let(:authentication) { {"email": "admin@easypep.de", "password": "welcome"}}
            run_test!
          end
    
          response '422', 'invalid request' do
            let(:authentication) {{"email": "admin@easypep.de" }}
            run_test!
          end
        end
      end
end
