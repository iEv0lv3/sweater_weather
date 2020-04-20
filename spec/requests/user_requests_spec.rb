require 'rails_helper'

RSpec.describe 'Users API', :vcr, type: :request do
  it 'successful register request' do
    post "/api/v1/users", params: {
      user: {
        email: 'whatever2@example.com',
        password: 'password',
        password_confirmation: 'password'
      }
    }
  end

  it 'successful login request' do
    User.create!(
      email: 'wowemail@mail.com',
      password: 'password'
    )

    post "/api/v1/sessions", params: {
      user: {
        email: 'wowemail@mail.com',
        password: 'password'
      }
    }
  end
end
