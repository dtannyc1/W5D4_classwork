# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Visit.destroy_all
ShortenedUrl.destroy_all

u1 = User.create(email: "u1@gmail.com")
u2 = User.create(email: "u2@gmail.com")
u3 = User.create(email: "u3@gmail.com")

url1 = ShortenedUrl.create(long_url: "google.com", user_id: u1.id)
url2 = ShortenedUrl.create(long_url: "bing.com", user_id: u2.id)
url3 = ShortenedUrl.create(long_url: "yahoo.com", user_id: u1.id)

visit1 = Visit.create(user_id: u2.id, shortened_url_id: url1.id)
visit2 = Visit.create(user_id: u2.id, shortened_url_id: url1.id)
visit3 = Visit.create(user_id: u2.id, shortened_url_id: url1.id)
visit4 = Visit.create(user_id: u2.id, shortened_url_id: url1.id)
visit5 = Visit.create(user_id: u1.id, shortened_url_id: url1.id)
visit6 = Visit.create(user_id: u1.id, shortened_url_id: url2.id)
