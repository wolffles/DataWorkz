User.create!(
email: "wolfie.truong@gmail.com",
password: "password"
)
User.create!(
email: "wolfgang.truong@gmail.com",
password: "password"
)

5.times do
  User.create!(
  email: Faker::Hipster.word + "@mail.com",
  password: "password"
  )
end

users = User.all

RegisteredApplication.create!(url:"demo-blocipedia.herokuapp.com", name: "blocipedia", user_id: 1)


puts "Seed Finished"
puts "#{User.count} user created"
puts "#{RegisteredApplication.count} Applications registered"
