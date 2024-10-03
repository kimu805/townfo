# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# #   Character.create(name: "Luke", movie: movies.first)

# User.create(nickname: "owner", profile: "私はこのグループのオーナーです。オーナーは以下のことができます。・グループへの参加を制限できる。<br>・メンバーの退会ができる。<br>・グループの情報を編集できる。" ,email: "owner@owner.com", password: "111111", password_confirmation: "111111")
# Group.create(name: "group1", description: "description of group1", owner_id: 1 )
# Membership.create(user_id: 1, group_id: 1)

# 10.times do |i|
#   User.create(nickname: "test#{i+1}", profile: "初めまして！test#{i+1}です！趣味はゴルフとサッカーです。よろしくお願いします！", email: "test#{i+1}@test.com", password: "111111", password_confirmation:"111111")
#   Membership.create(user_id: i+2, group_id: 1)
# end

# 7.times do |i|
#   Notice.create(title: "title#{i+1}", content: "content of title#{i+1}", tag_id: 3, user_id: 1, group_id: 1)
# end

10.times do |i|
  owner = User.create!(nickname: "owner#{i+1}", profile: "私はgroup#{i+1}のオーナーです。", email: "owner#{i+1}@owner.com", password: "111111", password_confirmation: "111111")
  group = Group.create!(name: "group#{i+1}", description: "description of group#{i+1}", owner_id: owner.id)
  Membership.create!(user_id: owner.id, group_id: group.id)
  5.times do |s|
    Notice.create!(title: "title#{s+1}", content: "content of title#{s+1}", tag_id: 2, user_id: owner.id, group_id: group.id )
  end
end

10.times do |i|
  member = User.create!(nickname: "test#{i+1}", profile: "私はgroup#{i+1}のメンバーです。", email: "test#{i+1}@test.com", password: "111111", password_confirmation: "111111")
  Membership.create!(user_id: member.id, group_id: i+1)
  5.times do |s|
    Notice.create!(title: "title#{s+6}", content: "content of title#{s+6}", tag_id: 3, user_id: member.id, group_id: i+1 )
  end
end