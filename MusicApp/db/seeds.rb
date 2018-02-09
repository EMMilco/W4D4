require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Band.destroy_all
20.times do
  Band.create(name: "The #{Faker::Pokemon.move}")
end

Album.destroy_all
100.times do
  Album.create(title: "#{Faker::StarTrek.villain}", band_id: Band.all.sample.id, year: (1950..2017).to_a.sample, studio: [true,false].sample)
end

Track.destroy_all
1000.times do
  Track.create(title: "#{Faker::Seinfeld.character}", album_id: Album.all.sample.id, ord: rand(2000), lyrics: "#{Faker::Movie.quote}", bonus: [true,false].sample)
end
