# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url = ["https://www.tout-pour-ton-mobile.com/wp-content/uploads/2019/02/Chewbacca-sonnerie-gratuite.png",
"https://vignette.wikia.nocookie.net/fr.starwars/images/1/19/Dark_Maul.png/revision/latest?cb=20160219095511",
"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Star_Wars_and_the_Power_of_Costume_July_2018_19_%28R2-D2_costume_from_Episode_IV%29.jpg/280px-Star_Wars_and_the_Power_of_Costume_July_2018_19_%28R2-D2_costume_from_Episode_IV%29.jpg",
"https://photos.lci.fr/images/613/344/vador-1-680895-0@1x.jpeg"]

name = ["Chewbacca", "Dark Maul", "R2D2", "Dark Vador"]

url.each_with_index do |ur, i|
  u = User.new
  u.name = name[i]
  u.email = "abc#{i}@gmail.com"
  u.remote_photo_url = ur
  u.password = "abc123"
  u.password_confirmation = "abc123"
  u.save
end

puts "Users created"

urls = ["http://golem13.fr/wp-content/uploads/2015/04/x-wing-in-space.jpg",
"http://static.flickr.com/32/45980348_42d12b2b0f.jpg",
"https://vignette.wikia.nocookie.net/stargate/images/3/3e/Aurora_Planet.jpg/revision/latest?cb=20080802205644",
"https://i.ytimg.com/vi/UfFiQ-gtLv4/hqdefault.jpg",
"https://vignette.wikia.nocookie.net/starwars/images/e/ec/Resistance_A-wing_SWCT.png/revision/latest?cb=20181015045043",
"https://i.redd.it/wzyg0gly4pp11.jpg",
"https://cdn.mos.cms.futurecdn.net/UDbjxFZAt5s3w38AFQEiiK-650-80.jpg",
"https://cdn.mos.cms.futurecdn.net/esXmA7paEWk2MFxLKNP7oU-650-80.jpg",
"https://cdn.mos.cms.futurecdn.net/uciG9WygFRtEDcvw9gitTd-650-80.jpg",
"https://cdn.mos.cms.futurecdn.net/9TNZYEyRPDPs5tDonx6h97-650-80.jpg",
"https://cdn.mos.cms.futurecdn.net/jkDe7DCh7sssEBGwxK5F6D-650-80.jpg",
"https://cdn.mos.cms.futurecdn.net/YoQmKtY2M2XDk2aSNATx55-650-80.jpg"]

names = ["X-Wing",
"Daedalus",
"Aurora",
"Tie Fighter",
"A-Wing",
"Naboo",
"Galactica",
"Elysium ship",
"Falcon",
"Serenity",
"Prometheus",
"District 9"]

description = ["Super fast",
  "Super comfortable",
  "Super cheap"]

urls.each_with_index do |urs, i|
  s = Spaceship.new()
  s.name = names[i]
  s.user_id = rand(4) + 1
  s.description = description[rand(3)]
  s.price = rand(6) * 1000 + 1000
  s.max_capacity = rand(15) + 1
  s.remote_photo_url = urs
  s.save
end

puts "Spaceships created"

Spaceship.where(user_id: 1).each do |sp|
  rental = Rental.new()
  rental.user_id = rand(3) + 2
  rental.spaceship_id = sp.id
  rental.accepted = false
  rental.start_date = "Fri, 24 May 2019"
  rental.end_date = "Fri, 24 May 2020"
  rental.save
end

puts "Rentals created"
