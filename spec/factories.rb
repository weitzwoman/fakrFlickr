FactoryGirl.define do
  factory(:user) do
    email "someone@person.com"
    password "password"
    password_confirmation "password"
  end
end
