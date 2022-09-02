# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

CSV.foreach('db/data/states.csv', headers: true) do |row|
  hash = row.to_h
  legal = hash['legal']
  if legal == '0'
    hash['legal'] = 'legal'
  elsif legal == '1'
    hash['legal'] = 'at risk'
  elsif legal == '2'
    hash['legal'] = 'illegal'
  end
  State.create(hash)
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

User.create!(email: 'frontend', token: 'ca912ed1df0d1c0f014ec94e3c731881')
