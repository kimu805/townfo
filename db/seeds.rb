# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(nickname: "owner", profile: "私はこのグループのオーナーです。オーナーは以下のことができます。・グループへの参加を制限できる。<br>・メンバーの退会ができる。<br>・グループの情報を編集できる。" ,email: "owner@owner.com", password: "111111", password_confirmation: "111111")
Group.create(name: "group1", description: "description of group1", owner_id: 1 )
Membership.create(user_id: 1, group_id: 1)

10.times do |i|
  User.create(nickname: "test#{i+1}", profile: "初めまして！test#{i+1}です！趣味はゴルフとサッカーです。よろしくお願いします！", email: "test#{i+1}@test.com", password: "111111", password_confirmation:"111111")
  Membership.create(user_id: i+2, group_id: 1)
end

7.times do |i|
  Notice.create(title: "title#{i+1}", content: "content of title#{i+1}", tag_id: 3, user_id: 1, group_id: 1)
end