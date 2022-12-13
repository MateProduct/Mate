# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{:uni => 'aa1000', :password => '123456', :password_confirmation=> '123456', :uname => 'Abi Marvin', :lionmail => 'aa1000@columbia.edu', :phone => '559-978-9812', :contact => 'Wechat: abimarv; Insta: _abimarv_', :time_slot => "[\"Mon Morning\"]", :description => '', :skills => "[\"Ruby\"]", :email_confirmed => true, :confirm_token => nil},
					{:uni => 'aa1100', :password => '1234567', :password_confirmation=> '1234567', :uname => 'Gautstafr Everett', :lionmail => 'aa1100@columbia.edu', :phone => '618-885-8915', :contact => 'Messenger: gautstafreverett', :time_slot => "[\"Tues Morning\"]", :description => '', :skills => "[\"Ruby\"]", :email_confirmed => true, :confirm_token => nil},
					{:uni => 'aa1200', :password => '12345', :password_confirmation=> '12345', :uname => 'Kornelia Félix', :lionmail => 'aa1200@columbia.edu', :phone => '212-203-5989', :contact => 'Whatsapp: 19194567854', :time_slot => "[\"Tues Evening\"]", :description => '', :skills => "[\"Ruby\"]", :email_confirmed => true, :confirm_token => nil},
					{:uni => 'aa1300', :password => '12345678', :password_confirmation=> '12345678', :uname => 'Natalio Louella', :lionmail => 'aa1300@columbia.edu', :phone => '212-463-2176', :contact => '', :time_slot => "[\"Wed Morning\"]", :description => '', :skills => "[\"Ruby\"]", :email_confirmed => true, :confirm_token => nil},
					{:uni => 'aa1400', :password => '1234', :password_confirmation=> '1234', :uname => 'Justina Neve', :lionmail => 'aa1400@columbia.edu', :phone => '212-458-2234', :contact => '', :time_slot => "[\"Thur Afternoon\"]", :description => '', :skills => "[\"Ruby\"]", :email_confirmed => true, :confirm_token => nil},
					{:uni => 'aa1500', :password => '123456789', :password_confirmation=> '123456789', :uname => 'Maud Hendrikje', :lionmail => 'aa1500@columbia.edu', :phone => '646-366-5775', :contact => '', :time_slot => "[\"Fri Evening\"]", :description => '', :skills => "[\"Ruby\"]", :email_confirmed => true, :confirm_token => nil},
					{:uni => 'aa1600', :password => '123', :password_confirmation=> '123', :uname => 'Shem Giffard', :lionmail => 'aa1600@columbia.edu', :phone => '646-635-4643', :contact => '', :time_slot => "[\"Sat Morning\"]", :description => '', :skills => "[\"Ruby\"]", :email_confirmed => true, :confirm_token => nil},
					{:uni => 'aa1700', :password => '1234567890', :password_confirmation=> '1234567890', :uname => 'Quinctus Pyrrhos', :lionmail => 'aa1700@columbia.edu', :phone => '917-258-0928', :contact => '', :time_slot => "[\"Sun Afternoon\"]", :description => '', :skills => "[\"Ruby\"]", :email_confirmed => true, :confirm_token => nil},
  	 ]
courses = [
           {:course_no => 'COMSW4152', :uni => 'aa1000', :section_no => '001'},
					 {:course_no => 'COMSW4152', :uni => 'aa1100', :section_no => '001'},
					 {:course_no => 'COMSW4152', :uni => 'aa1200', :section_no => '001'},
					 {:course_no => 'COMSW4152', :uni => 'aa1300', :section_no => '001'},
					 {:course_no => 'COMSW4152', :uni => 'aa1400', :section_no => '001'},
					 {:course_no => 'COMSW4152', :uni => 'aa1500', :section_no => '001'},
					 {:course_no => 'COMSW4152', :uni => 'aa1600', :section_no => '002'},
					 {:course_no => 'COMSW4152', :uni => 'aa1700', :section_no => '002'},

					 {:course_no => 'COMSW4111', :uni => 'aa1000', :section_no => '001'},
					 {:course_no => 'COMSE6156', :uni => 'aa1100', :section_no => '001'},
]

users.each do |user|
  User.create!(user)
end

courses.each do |course|
  Course.create!(course)
end