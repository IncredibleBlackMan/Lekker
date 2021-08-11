require 'swagger_helper'

RSpec.describe 'api/status_managements', type: :request do
    path '/status_managements' do

        get 'lists statuses' do
          consumes 'application/json'
    
          response '200', 'status amanagements retrieved' do
            let(:Authentication) { "Bearer #{::Base64.strict_encode64('jsmith:jspass')}" }
            run_test!
          end
        end
    end
end
