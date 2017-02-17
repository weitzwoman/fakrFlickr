require 'rails_helper'

describe User do
  it 'creates a user account' do
    user = User.create(:email => "person@person.com", :password => "password", :password_confirmation => "password")
    expect(user.email).to eq("person@person.com")
  end
end
