require 'factory_bot'

user = User.create(email: "email@website.com", username: "username", password: "password")
user.confirm

50.times do
  FactoryBot.create(:monster, user: user)
end
