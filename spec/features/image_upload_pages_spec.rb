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

describe 'delete an image' do
  it "deletes image" do
    user = FactoryGirl.create(:user)
    user = FactoryGirl.create(:image)
    visit '/users/sign_in'
    fill_in 'Email', :with => 'j@email.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    click_on 'users/1/images/1'
    click_on 'Delete Image'
    expect(page).to have_content 'Personal Photo Gallery'

  end
end
