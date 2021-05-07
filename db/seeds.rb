# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Places.destroy_all
#Pictures.destroy_all
#Comments.destroy_all


User.destroy_all

juan = User.create!(name: 'Juan', email: 'juan@example.com', password: '123123')

puts "++++++++++++"

place_sabana = Place.create!(name:'Sabana', address: "Sabana , Mata Redonda")
place_sanjose = Place.create!(name:'San Jose', address: "San Jose, Catedral")
place_barva = Place.create!(name:'Barva', address: "Heredia")
place_puntarenas = Place.create!(name:'Puntarenas', address: "Puntarenas")
place_sancarlos = Place.create!(name:'San Carlos', address: "Ciudad Quesada")

10.times do |i|
  c = place_sabana.comments.build(user_id:juan.id, content: "Que lindo lugar es este#{i}")
  c.save
end

#pictures_p = picture.create![[File.open('assets/images/p.png')], user_id:juan.id]

puts "++++++++++++"

#picture_sabana = Picture.create!(user_id:juan.id)

#10.times do |i|
  #p = picture_sabana.pictures.build(user_id:juan.id, File.open('./assets/images/p.png'))
  #p.save
#end



#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


