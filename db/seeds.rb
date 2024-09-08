# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(nickname: "owner", email: "owner@owner.com", password: "111111", password_confirmation: "111111")
User.create(nickname: "test1", email: "test1@test.com", password: "111111", password_confirmation: "111111")
User.create(nickname: "test2", email: "test2@test.com", password: "111111", password_confirmation: "111111")

10.times do |i|
  Group.create(name: "group#{i + 1}", description: "Description of #{i + 1}", owner_id: 1)
  Membership.create(user_id: 1, group_id: i + 1)
end

5.times do |i|
  Notice.create(title: "title#{i+1}", content: "content of title#{i+1}", tag_id: 2 , user_id: 1, group_id: 1)
end