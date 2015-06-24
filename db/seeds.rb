# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


factories = Factory.create([{ name: 'H & H Robotics', email: 'house@test.com', address1: '123 New Vegas Strip', city: 'New Vegas', state: 'NV', zipcode: '12345', tags: 'robots, electronics, scrap metal'},
                            { name: 'Factory A', email: 'factorya@test.com', address1: '23 New Factory St', city: 'New York', state: 'NY', zipcode: '44345'},
                            { name: 'The Mill', email: 'david@lynch.com', address1: '12 Mullholland Dr', city: 'Los Angeles', state: 'CA', zipcode: '55432'},
                            { name: 'Silver Rush', email: 'silver@test.com', address1: '332 Atlantic Ave', city: 'Brooklyn', state: 'NY', zipcode: '65364', tags: 'jewelry, silver'}
                           ])
