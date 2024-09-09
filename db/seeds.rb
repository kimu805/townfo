# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ownerユーザー
10.times do |i|
  User.create(nickname: "owner#{i + 1}", email: "owner#{i + 1}@owner.com", password: "111111", password_confirmation: "111111")
  Group.create(name: "group#{i + 1}", description: "Description of #{i + 1}", owner_id: i + 1)
  Membership.create(user_id: i + 1, group_id: i + 1)
end

# testユーザー
10.times do |i|
  User.create(nickname: "test#{i + 1}", email: "test#{i + 1}@test.com", password: "111111", password_confirmation: "111111")
  Membership.create(user_id: i + 11, group_id: i + 1)
end

3.times do |i|
  Notice.create(title: "title#{i+1}", content: "content of title#{i+1}", tag_id: 2 , user_id: 1, group_id: 1)
end

2.times do |i|
  Notice.create(title: "title#{i+4}", content: "content of title#{i+4}", tag_id: 4 , user_id: 11, group_id: 1)
end