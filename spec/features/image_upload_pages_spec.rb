require 'rails_helper'

describe 'upload an image' do
  it 'uploads an image selected by the user' do
    visit '/'
    click_on "Sign Up"
    fill_in "user[email]", :with => 'people@people.com'
    fill_in "user[password]", :with => 'password'
    fill_in "user[password_confirmation]", :with => 'password'
    click_on "Sign up"
    click_on "Personal Photo Gallery"
    click_on "Add New Image"
    page.attach_file("New Image", 'spec/fixtures/images/smallwater.jpg')
    click_on "Create Image"
    expect(page).to have_content("Personal Photo Gallery")
  end
end
