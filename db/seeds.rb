# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  category = Category.create([
  	{ name: 'Gossip', publish: true },
  	{ name: 'Hot Clip', publish: true },
  	{ name: 'Movie', publish: true },
  	{ name: 'Lakorn', publish: true },
  	{ name: 'Music', publish: true },
  	{ name: 'Socciety', publish: true },
  	{ name: 'My idol', publish: true },
  	{ name: 'Beauty by Stuning', publish: true },
  	{ name: 'Life Style', publish: true },
  	{ name: 'Travel by Sense & Scene', publish: true },
  ])
