# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(username: 'marco', password: "rtfgvb90", password_confirmation: "rtfgvb90")

Post.create(title: "ciao", content_md: "#Ciao sono marco", user_id: user.id)