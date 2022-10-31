
Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create user
  end
end

When /I fill in "(.*)" in password and "(.*)" in password_confirmation/ do |e1,e2|
  expect()
end