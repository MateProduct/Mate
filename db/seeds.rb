# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{:uni => 'aa1000', :password => '123456', :uname => 'aa1000', :lionmail => 'aa1000@columbia.edu', :phone => '123-456-7890', :contact => '', :time_slot => 'Monday', :description => 'Null', :skills => 'Ruby'},
					{:uni => 'aa1100', :password => '1234567', :uname => 'aa1100', :lionmail => 'aa1100@columbia.edu', :phone => '123-654-7890', :contact => '', :time_slot => 'Monday', :description => 'Null', :skills => 'Ruby'},
					{:uni => 'aa1200', :password => '12345', :uname => 'aa1200', :lionmail => 'aa1200@columbia.edu', :phone => '123-465-7890', :contact => '', :time_slot => 'Tuesday', :description => 'Null', :skills => 'Ruby'},
					{:uni => 'aa1300', :password => '12345678', :uname => 'aa1300', :lionmail => 'aa1300@columbia.edu', :phone => '321-456-7890', :contact => '', :time_slot => 'Wednesday', :description => 'Null', :skills => 'Ruby'},
					{:uni => 'aa1400', :password => '1234', :uname => 'aa1400', :lionmail => 'aa1400@columbia.edu', :phone => '121-456-7890', :contact => '', :time_slot => 'Thursday', :description => 'Null', :skills => 'Ruby'},
					{:uni => 'aa1500', :password => '123456789', :uname => 'aa1500', :lionmail => 'aa1500@columbia.edu', :phone => '313-456-7890', :contact => '', :time_slot => 'Friday', :description => 'Null', :skills => 'Ruby'},
					{:uni => 'aa1600', :password => '123', :uname => 'aa1600', :lionmail => 'aa1600@columbia.edu', :phone => '232-456-7890', :contact => '', :time_slot => 'Saturday', :description => 'Null', :skills => 'Ruby'},
					{:uni => 'aa1700', :password => '1234567890', :uname => 'aa1700', :lionmail => 'aa1700@columbia.edu', :phone => '123-456-7899', :contact => '', :time_slot => 'Sunday', :description => 'Null', :skills => 'Ruby'},
  	 ]

users.each do |user|
  User.create!(user)
end