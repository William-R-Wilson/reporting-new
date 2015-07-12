# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    users = User.create([{ name: "Will", email: "will@will.com", 
                          password_digest: BCrypt::Password.create('secret'), 
                          admin: true, splits: "Admin, 1" }, { name: "Bob", email: "bob@bob.com", 
                          password_digest: BCrypt::Password.create('secret'),
                          admin: false, splits: "Education, .5, Development, .5" }, 
                          {name: "Janet", email: "janet@janet.com",
                          password_digest: BCrypt::Password.create('secret'),
                          admin: false, splits: "Development, .5, Education, .5"}])
                          
    programs = Program.create([{ name: "Admin"}, {name: "Development"}, {name: "Youth Programs"}])
    accounts = Account.create([{ name: "Staff Travel"}, {name: "Workshop Participant Travel"}, {name: "Materials"}, {name: "Office Supplies"}])
    pay_periods = PayPeriod.create([{ date: "2015-06-29"}, {date: "2015-07-12"}])
    time_records = TimeRecord.create([{hours: 80, sick:0, vacation: 0, date:"2015-06-29", user_id: 1}, 
                                      {hours: 72, sick:8, vacation: 0, date:"2015-06-29", user_id: 2},
                                      {hours: 64, sick:8, vacation: 8, date:"2015-06-29", user_id: 3},
                                      {hours: 80, sick:0, vacation: 0, date:"2015-07-12", user_id: 1},
                                      {hours: 80, sick:0, vacation: 0, date:"2015-07-12", user_id: 2},
                                      {hours: 80, sick:0, vacation: 0, date:"2015-07-12", user_id: 3}])
                                      
    transactions = Transaction.create([ {date: "2015-07-04", vendor: "Cookie Monster", who: "Elmo", what: "Cookies", amount: 5.99, user_id: 1, account_id: 1, program_id: 1},
                                        {date: "2015-07-04", vendor: "Cookie Monster", who: "Elmo", what: "Milk", amount: 2.50, user_id: 1, account_id: 1, program_id: 1},
                                        {date: "2015-07-05", vendor: "Pappy's Moonshine Shack", who: "Bob", what: "Moonshine", why: "to ease the hurtin", amount: 10.00, user_id: 2, account_id: 2, program_id: 2},
                                        {date: "2015-07-06", vendor: "Jimi Hendrix", who: "Rick Grimes", what: "a horse", amount: 1200.00, user_id: 3, account_id: 3, program_id: 3}])
                          
                          
                          