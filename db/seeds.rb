User.create!(
email: "wolfgang.truong@gmail.com",
password: "password"
)

User.create!(
email: "wolfie.truong@gmail.com",
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

RegisteredApplication.create!(url:"wolfgangtruong.site", name: "portfolio", user_id: 1)

RegisteredApplication.create!(url: "demo-bloccit.herokuapp.com", name:"bloccit", user_id:1)

20.times {
  RegisteredApplication.create!(url:Faker::Hacker.noun + ".com", name:"arbitrary", user_id: User.all.sample.id)
}
50.times{
  Event.create!(name:"view",  registered_application_id: RegisteredApplication.all[0..2].sample.id)
}

puts "Seed Finished"
puts "#{User.count} user created"
puts "#{RegisteredApplication.count} Applications registered"
puts "#{Event.count} Events created"
