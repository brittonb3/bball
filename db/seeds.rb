# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

 10.times do
   Drill.create!(
     title:  RandomData.random_sentence,
     description:   RandomData.random_paragraph
   )
 end
 drills = Drill.all

 10.times do
   Play.create!(
    title: RandomData.random_sentence,
    description: RandomData.random_paragraph
   )
 end
 plays = Play.all


 puts "Seed finished"
 puts "#{Drill.count} drills created"
 puts "#{Play.count} plays created"
