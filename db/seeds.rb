# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create(: name: 'Star Wars' ,: name: 'Lord of the Rings' ])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(
  name: 'general_user',
  email: 'general_user@example.com',
  password: '11111111',
  password_confirmation: '11111111',
  admin: false
)

User.create!(
  name: 'general_user2',
  email: 'general_user2@example.com',
  password: '11111111',
  password_confirmation: '11111111',
  admin: false
)

User.create!(
  name: 'general_user3',
  email: 'general_user3@example.com',
  password: '11111111',
  password_confirmation: '11111111',
  admin: false
)

User.create!(
  name: 'general_user4',
  email: 'general_user4@example.com',
  password: '11111111',
  password_confirmation: '11111111',
  admin: false
)

User.create!(
  name: 'general_user5',
  email: 'general_user5@example.com',
  password: '11111111',
  password_confirmation: '11111111',
  admin: false
)

User.create!(
  name: 'general_user6',
  email: 'general_user6@example.com',
  password: '11111111',
  password_confirmation: '11111111',
  admin: true
)

5.times do |i|
  Task.create(user_id: User.find(i+1).id, content: '勉強する :i+1', expired_at:'2021/11/3' )
end

5.times do |i|
  Reward.create(user_id: User.find(i+1).id, content: 'コンビニスイーツを買う :i+1' )
end

5.times do |i|
  Schedule.create(user_id: User.find(i+1).id, content: '友達と遊ぶ :i+1', start_time:'2021/11/3')
end