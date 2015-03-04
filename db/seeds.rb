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
      venue = User.create!(
        name:    Faker::Company.name,
        address: Faker::Address.street_name
      )
      puts "Venue #{venue.name} was created!"
    end
  end

  def generate_artists
    20.times do
      artist = User.create!(
        name: Faker::Name.name
      )
      puts "Artist #{artist.name} was created!"
    end
  end

  def generate_events
    100.times do
      event = Event.create!(
        display_name:      Faker::Company.name,
        type:
        datetime:
        age_restriction:
        popularity:
        uri:
        venue_id:  rand(0..10),
        artist_id: rand(0..20)
      )
      puts "Venue #{event.name} was created!"
    end
  end
end

Seed.generate
