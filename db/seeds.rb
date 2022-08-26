# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

CSV.foreach('db/data/states.csv', headers: true) do |row|
  State.create(row.to_h)
end

CSV.foreach('db/data/misinformation_centers.csv', headers: true) do |row|
  MisinformationCenter.create(row.to_h)
end

CSV.foreach('db/data/authorized_clinics.csv', headers: true) do |row|
  AuthorizedClinic.create(row.to_h)
end

CSV.foreach('db/data/resources.csv', headers: true) do |row|
  Resource.create(row.to_h)
end
