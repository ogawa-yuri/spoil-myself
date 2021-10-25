# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create(: name: 'Star Wars' ,: name: 'Lord of the Rings' ])
#   Character.create(name: 'Luke', movie: movies.first)

#ユーザーのseedデータ

@general_user = User.create!(
  name: 'general_user',
  email: 'general_user@example.com',
  password: '11111111',
  password_confirmation: '11111111',
  admin: false
)

@admin_user = User.create!(
  name: 'admin_user',
  email: 'admin_user@example.com',
  password: '11111111',
  password_confirmation: '11111111',
  admin: true
)

#タスクのseedデータ

Task.create(
  user_id: @general_user.id,
  content: '勉強する',
  expired_at:'2021/11/3'
)

Task.create(
  user_id: @general_user.id,
  content: '買い物に行く',
  expired_at:'2021/11/4'
)

Task.create(
  user_id: @general_user.id,
  content: '英語の勉強をする',
  expired_at:'2021/11/5'
)

Task.create(
  user_id: @general_user.id,
  content: 'スクワットをする',
  expired_at:'2021/11/6'
)

Task.create(
  user_id: @general_user.id,
  content: '夕飯を作る',
  expired_at:'2021/11/7'
)

Task.create(
  user_id: @admin_user.id,
  content: ' 英語の勉強する',
  expired_at:'2021/11/6'
)

Task.create(
  user_id: @admin_user.id,
  content: '水を買いにに行く',
  expired_at:'2021/11/2'
)

Task.create(
  user_id: @admin_user.id,
  content: 'プログラミングの勉強をする',
  expired_at:'2021/11/7'
)

Task.create(
  user_id: @admin_user.id,
  content: '腹筋をする',
  expired_at:'2021/11/11'
)

Task.create(
  user_id: @admin_user.id,
  content: '朝ごはんを作る',
  expired_at:'2021/11/13'
)

#スケジュールのseedデータ

Schedule.create(
  user_id: @general_user.id,
  content: '友達と遊ぶ',
  start_time:'2021/11/15'
)

Schedule.create(
  user_id: @general_user.id,
  content: '宿題をやる',
  start_time:'2021/11/2'
)

Schedule.create(
  user_id: @general_user.id,
  content: '掃除機をかける',
  start_time:'2021/11/22'
)

Schedule.create(
  user_id: @general_user.id,
  content: '仕事に行く',
  start_time:'2021/11/23'
)

Schedule.create(
  user_id: @general_user.id,
  content: '読書する',
  start_time:'2021/11/24'
)

Schedule.create(
  user_id: @admin_user.id,
  content: '家族とご飯',
  start_time:'2021/11/15'
)

Schedule.create(
  user_id: @admin_user.id,
  content: 'ランニング',
  start_time:'2021/11/2'
)

Schedule.create(
  user_id: @admin_user.id,
  content: '仕事する',
  start_time:'2021/11/22'
)

Schedule.create(
  user_id: @admin_user.id,
  content: '夕飯の準備をする',
  start_time:'2021/11/23'
)

Schedule.create(
  user_id: @admin_user.id,
  content: '読書する',
  start_time:'2021/11/24'
)

#ご褒美のseedデータ

Reward.create(
  user_id: @general_user.id,
  content: 'ケーキを買う',
)

Reward.create(
  user_id: @general_user.id,
  content: '昼寝する',
)

Reward.create(
  user_id: @general_user.id,
  content: '映画を見に行く',
)

Reward.create(
  user_id: @general_user.id,
  content: 'Uber Eatsする権利',
)

Reward.create(
  user_id: @general_user.id,
  content: 'コンビニスイーツ買う',
)

Reward.create(
  user_id: @admin_user.id,
  content: 'ケーキを買う',
)

Reward.create(
  user_id: @admin_user.id,
  content: 'マッサージに行く',
)

Reward.create(
  user_id: @admin_user.id,
  content: '映画を見に行く',
)

Reward.create(
  user_id: @admin_user.id,
  content: '外食する権利',
)

Reward.create(
  user_id: @admin_user.id,
  content: 'コンビニで好きなもの買う',
)