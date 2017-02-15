require 'rails_helper'

describe 'upload an image' do
  it 'uploads an avatar image selected by the user' do
    user = User.create(:email => "person@person.com", :password => "password", :password_confirmation => "password")
    visit edit_user_registration_path(user)
    click_on "Choose File"
    page.attach_file("Smallwater", 'spec/fixtures/images/smallwater.jpg')
    fill_in "Current Password", :with => "password"
    click_button 'Update'
    expect(page).to have_content "Smallwater"
  end
end
