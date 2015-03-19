# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
class Seed
  def self.generate
    seed = new
    seed.generate_users
    seed.generate_venues
    seed.generate_artists
    seed.generate_events
    seed.generate_artist_events
  end

  def generate_users
    10.times do
      user = User.create!(
        name:  Faker::Name.name,
        email: Faker::Internet.email
      )
      puts "User #{user.name} was created!"
    end
  end

  def generate_venues
    10.times do
      venue = Venue.create!(
        display_name: Faker::Company.name,
        street:       Faker::Address.street_address,
        zip:          Faker::Address.zip,
        country:      Faker::Address.country,
        lat:          Faker::Address.latitude,
        lng:          Faker::Address.longitude,
        capacity:     rand(500..10000)
      )
      puts "Venue #{venue.display_name} was created!"
    end
  end

  def generate_artists
    20.times do
      artist = Artist.create!(
        display_name: Faker::Name.name
      )
      puts "Artist #{artist.display_name} was created!"
    end
  end

  def generate_artist_events
    20.times do
      artist_events = ArtistsEvent.create!(
      artist_id: rand(0..20),
      event_id:  rand(0..10)
      )
    end
  end

  def generate_events
    event_type = ['festival', 'concert']
    100.times do
      event = Event.create!(
        display_name:      Faker::Company.name,
        datetime:          Faker::Time.forward(200, :evening),
        age_restriction:   rand(14..21),
        popularity:        rand(0.1..0.9),
        city:              Faker::Address.city,
        lat:               Faker::Address.latitude,
        lng:               Faker::Address.longitude,
        location:          Faker::Address.street_address,
        state:             Faker::Address.state,
        event_type:        event_type.sample
      )
      puts "Events #{event.display_name} was created!"
    end
  end
end

Seed.generate
