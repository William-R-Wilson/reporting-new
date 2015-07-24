# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    users = User.create([{ name: "Will", email: "will@highlandercenter.org", 
                          password_digest: BCrypt::Password.create('secretest'), 
                          admin: true, splits: "Admin, 1" }])
                          
    programs = Program.create([{ name: "Admin"}, {name: "Development"}, {name: "General Ed"}])
    accounts = Account.create([{ name: "Staff Travel"}, {name: "Workshop Participant Travel"}, {name: "Board Travel"}, {name: "Materials"}, {name: "Office Supplies"}])
    pay_periods = PayPeriod.create([{ date: "2015-07-24"}])

                                      

                          
                          
                          