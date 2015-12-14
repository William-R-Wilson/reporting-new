# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    users = User.create([{ first_name: "Will", last_name: "Wilson", email: "will@will.com",
                          password_digest: BCrypt::Password.create('secretest'),
                          admin: true, coordinator: false, splits: "Admin, 1", percent_time: 1.0,
                          start_date: "2015-07-01", starting_sick: 0, starting_vacation: 0},
                          { first_name: "Bob", last_name: "Dobbs", email: "bob@jrbobdobbs.com",
                            password_digest: BCrypt::Password.create('secretest'),
                            admin: false, coordinator: true, splits: "Development, .5, General Ed, .5",
                            percent_time: 1.0, start_date: "2015-07-01", starting_sick: 0,
                            starting_vacation: 0}, { first_name: "Rick", last_name: "Grimes", email: "sheriffgrimes@kingcounty.gov",
                            password_digest: BCrypt::Password.create('secretest'),
                            admin: false, coordinator: false, splits: "Development, .2, General Ed, .8",
                            percent_time: 1.0, start_date: "2015-01-01", starting_sick: 0,
                            starting_vacation: 0}])

    programs = Program.create([{ name: "Admin"}, {name: "Development"}, {name: "General Ed"}])
    accounts = Account.create([{ name: "Staff Travel"}, {name: "Board Travel"}, {name: "Materials"}, {name: "Office Supplies"}])
    pay_periods = PayPeriod.create([{ date: "2015-07-24"}, { date: "2015-08-10"}])
    time_records = TimeRecord.create([{ date: "2015-07-24", hours: 80, vacation: 0, sick: 0, holiday: 0, inclement_weather: 0, bereavement: 0, jury_duty: 0, user_id: 1},
                    { date: "2015-08-10", hours: 72, vacation: 8, sick: 0, holiday: 0, inclement_weather: 0, bereavement: 0, jury_duty: 0, user_id: 1},
                    { date: "2015-07-24", hours: 80, vacation: 0, sick: 0, holiday: 0, inclement_weather: 0, bereavement: 0, jury_duty: 0, user_id: 2},
                    { date: "2015-08-10", hours: 64, vacation: 0, sick: 16, holiday: 0, inclement_weather: 0, bereavement: 0, jury_duty: 0, user_id: 2},
                    { date: "2015-07-24", hours: 80, vacation: 0, sick: 0, holiday: 0, inclement_weather: 0, bereavement: 0, jury_duty: 0, user_id: 3},
                    { date: "2015-08-10", hours: 40, vacation: 40, sick: 0, holiday: 0, inclement_weather: 0, bereavement: 0, jury_duty: 0, user_id: 3}])
    99.times do |n|
      date = Faker::Date.backward(180)
      vendor = Faker::Company.name
      who = Faker::Name.name
      what = Faker::Commerce.product_name
      why = Faker::Lorem.word
      amount = Faker::Number.decimal(2)
      user_id = (1 + rand(3))
      account_id = (1 + rand(4))
      program_id = (1 + rand(3))
      Transaction.create!( date: name,
                          vendor: vendor,
                          who: who,
                          what: what,
                          why: why,
                          amount: amount,
                          user_id: user_id,
                          account_id: account_id,
                          program_id: program_id
                          )
    end
