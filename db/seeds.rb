# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create(
  [
    {
      email: 'mcatrett@gmail.com',
      password: 'bnmbnmbnm',
      password_confirmation: 'bnmbnmbnm',
      reset_password_token: nil,
      reset_password_sent_at: nil,
      remember_created_at: nil,
      sign_in_count: 1,
      current_sign_in_at: Time.now,
      last_sign_in_at: Time.now,
      current_sign_in_ip: "127.0.0.1",
      last_sign_in_ip: "127.0.0.1"
    }
  ]
)

media = Medium.create(
  [
    {
      format_type_id: 1,
      external_id: 'lPLvkrtqkJ8',
      name: 'Tested Episode',
      length_in_seconds: 1979,
      user_id: 1
    },
    {
      format_type_id: 1,
      external_id: 'hxRoK5LZa_A',
      name: 'Another Tested Episode',
      length_in_seconds: 936,
      user_id: 1
    }
  ]
)

queue_items = QueueItem.create(
  [
    {
      medium_id: media.first.id,
      queue_slot: 3465456456
    },
    {
      medium_id: media.second.id,
      queue_slot: 34654568768
    },
  ]
)

