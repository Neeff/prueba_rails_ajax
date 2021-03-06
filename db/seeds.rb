# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Company.destroy_all
Claim.destroy_all
AdminUser.destroy_all


20.times do
  Company.create(name: Faker::Company.name)
end

30.times do
  User.create(email: Faker::Internet.email, password: '123456')
end

companies = Company.all.pluck(:id)
users = User.all.pluck(:id)

250.times do |i|
  Claim.create(claim: "reclamo #{i}",user_id: users.sample, company_id: companies.sample)
end
AdminUser.create!(email: 'admin@app.com', password: 'SomePassword', password_confirmation: 'SomePassword')