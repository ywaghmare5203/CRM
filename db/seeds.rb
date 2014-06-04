# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'active_record/reset_pk_sequence.rb'

User.delete_all
User.reset_pk_sequence

Artist.delete_all
Artist.reset_pk_sequence

Album.delete_all
Album.reset_pk_sequence

Song.delete_all
Song.reset_pk_sequence

Badge.delete_all
Badge.reset_pk_sequence

users = [
  { 
    id: 1, 
    name: "Andree", 
    email: "andree.surya@gmail.com", 
    password: "karaoke.andree",
    password_confirmation: "karaoke.andree"
  },
  {
    id: 2, 
    name: "Martin", 
    email: "mb@emoreco.de", 
    password: "karaoke.martin",
    password_confirmation: "karaoke.martin"
  }
]

artists = [
  {id:   1, name: "Bill Withers"},
  {id:   2, name: "Alicia Keys"},
  {id:   3, name: "Blu Cantrell"},
  {id:   4, name: "Bob Marley"},
  {id:   5, name: "Buggles"},
  {id:   6, name: "Busted"},
  {id:   7, name: "Cindy Lauper"},
  {id:   8, name: "Destiny's Child"},
  {id:   9, name: "Dido"},
  {id:  10, name: "Scissor Sisters"},
  {id:  11, name: "Spandau Ballet"},
  {id:  12, name: "The Foundations"},
  {id:  13, name: "Tiffany"},
  {id:  14, name: "Amerie"},
  {id:  15, name: "Amy Winehouse"},
  {id:  16, name: "Anastacia"},
  {id:  17, name: "Baverly Knight"},
  {id:  18, name: "Black Eyed Peas"},
  {id:  19, name: "Chris Brown"},
  {id:  20, name: "Christina Milan"},
  {id:  21, name: "Corinne Bailey Rae"},
  {id:  22, name: "Diana Ross and The Supremes"},
  {id:  23, name: "DJ Jazzy Jeff"},
  {id:  24, name: "Edwin Starr"},
  {id:  25, name: "En Vogue"},
  {id:  26, name: "Four tops"},
  {id:  27, name: "Gwen Stefani"},
  {id:  28, name: "Jamelia"},
  {id:  29, name: "Jamiroquai"},
  {id:  30, name: "Luther Vandross"},
  {id:  31, name: "Mark Ronson"},
  {id:  32, name: "Martha Reeves and The Vandellas"},
  {id:  33, name: "Outkast"},
  {id:  34, name: "Pussy Cat Dolls"},
  {id:  35, name: "Rihanna"},
  {id:  36, name: "Salt N' Pepa"},
  {id:  37, name: "Sugababes"},
  {id:  38, name: "The 411"},
  {id:  39, name: "Whitney Houston"},
  {id:  40, name: "Womack and Womack"},
  {id:  41, name: "Lady Gaga"},
  {id:  42, name: "Katy Perry"},
  {id:  43, name: "Amy MacDonald"},
  {id:  44, name: "Yolanda Be Cool & Cup"},
  {id:  45, name: "The White Stripes"},
  {id:  46, name: "Jason Mraz"},
  {id:  47, name: "Good Life"}
]

albums = [
  # TODO: Fill in the album information.
]

songs = [
  {id:   1, artist_id:   1, title: "Ain't No Sunshine"},
  {id:   2, artist_id:   2, title: "Fallin'"},
  {id:   4, artist_id:   4, title: "No Woman No Cry"},
  {id:   5, artist_id:   5, title: "Video Killed The Radio Star"},
  {id:   8, artist_id:   8, title: "Survivor"},
  {id:   9, artist_id:   9, title: "White Flag"},
  {id:  15, artist_id:  15, title: "Back To Black"},
  {id:  16, artist_id:  16, title: "I'm Outta Love"},
  {id:  18, artist_id:  18, title: "Pump It"},
  {id:  19, artist_id:  19, title: "Yo (Excuse Me Miss)"},
  {id:  22, artist_id:   8, title: "Bootylicious"},
  {id:  28, artist_id:  27, title: "Hollaback Girl"},
  {id:  37, artist_id:  35, title: "We Ride"},
  {id:  39, artist_id:  37, title: "Ugly"},
  {id:  41, artist_id:  39, title: "My Love Is Your Love"},
  {id:  43, artist_id:  41, title: "Poker Face"},
  {id:  44, artist_id:  42, title: "California Gurls (feat. Snoop Dogg)"},
  {id:  45, artist_id:  43, title: "This is The Life"},
  {id:  46, artist_id:  44, title: "We No Speak Americano (Original Mix)"},
  {id:  47, artist_id:  45, title: "Seven Nation Army"},
  {id:  48, artist_id:  46, title: "I'm Yours"}
]

badges = [
  {id:   1, category: "sing_count", required_value:   1, name: "In the Shower Star", description: "Sing at least 1 song"},
  {id:   2, category: "sing_count", required_value:   5, name: "Karaoke Star", description: "Sing 5 songs"},
  {id:   3, category: "sing_count", required_value:  10, name: "Student Band Star", description: "Sing 10 songs"},
  {id:   4, category: "sing_count", required_value:  15, name: "Club Star", description: "Sing 15 songs"},
  {id:   5, category: "sing_count", required_value:  30, name: "Local Star", description: "Sing 30 songs"},
  {id:   6, category: "sing_count", required_value:  60, name: "Casting Star", description: "Sing 60 songs"},
  {id:   7, category: "sing_count", required_value: 100, name: "Rising Star", description: "Sing 100 songs"},
  {id:   8, category: "sing_count", required_value: 150, name: "National Star", description: "Sing 150 songs"},
  {id:   9, category: "sing_count", required_value: 200, name: "Starlet", description: "Sing 200 songs"},
  {id:  10, category: "sing_count", required_value: 300, name: "Chart-Breaker", description: "Sing 300 songs"},
  {id:  11, category: "sing_count", required_value: 400, name: "International Selling Artist", description: "Sing 400 songs"},
  {id:  12, category: "sing_count", required_value: 500, name: "International Star", description: "Sing 500 songs"},
  {id:  13, category: "sing_count", required_value: 600, name: "Super Star", description: "Sing 600 songs"}
]

# NOTE: ID field is attr_protected, so it can't be set using mass assignment.
#     Therefore, we won't use ActiveRecord::Base create! method.

users.each do |i|
  record = User.new i
  record.id = i[:id]
  record.save!
end

artists.each do |i|
  record = Artist.new i
  record.id = i[:id] 
  record.save!
end

albums.each do |i|
  record = Album.new i
  record.id = i[:id]
  record.save!
end

songs.each do |i|
  record = Song.new i
  record.id = i[:id]
  record.save!
end

badges.each do |i|
  record = Badge.new i
  record.id = i[:id]
  record.save!
end

