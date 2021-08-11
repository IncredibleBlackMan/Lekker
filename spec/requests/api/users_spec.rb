require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
    path '/users' do

        get 'lists users' do
          consumes 'application/json'
    
          response '200', 'users retrieved' do
            let(:Authentication) { "Bearer #{::Base64.strict_encode64('jsmith:jspass')}" }
            run_test!
          end
        end
    end

    path '/users' do
        get 'Filters users' do
            consumes 'application/json'
            parameter name: :status, in: :body, schema: {
              type: :array
            }
    
          response '200', 'users retrieved' do
            let(:Authentication) { "Bearer #{::Base64.strict_encode64('jsmith:jspass')}" }
            run_test!
          end
        end
    end

    path '/users/{id}/archive' do

        put 'Archives a user' do
          produces 'application/json'
    
          response '200', 'user archived' do
    
            let(:Authentication) { "Bearer #{::Base64.strict_encode64('jsmith:jspass')}" }
            run_test!
          end
    
          response '200', 'user archived' do
            let(:Authentication) { "Bearer #{::Base64.strict_encode64('jsmith:jspass')}" }
            run_test!
          end
        end
    end

    path '/users/{id}/unarchive' do

        put 'Unarchives a user' do
          produces 'application/json'
    
          response '200', 'user unarchived' do
    
            let(:Authentication) { "Bearer #{::Base64.strict_encode64('jsmith:jspass')}" }
            run_test!
          end
    
          response '200', 'user unarchived' do
            let(:Authentication) { "Bearer #{::Base64.strict_encode64('jsmith:jspass')}" }
            run_test!
          end
        end
    end
end
