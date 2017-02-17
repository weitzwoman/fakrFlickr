FactoryGirl.define do
  factory(:user) do
    email "someone@person.com"
    password "password"
    password_confirmation "password"
  end

  factory(:image) do
    image_source { File.new(Rails.root.join("spec","fixtures","images","smallwater.jpg")) }
    owner_id '1'
  end
end
