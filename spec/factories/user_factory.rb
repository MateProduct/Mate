FactoryBot.define do
  factory :user do
    uni { "aa1000" }
    uname { "aa1000" }
    password {"123456"}
    password_confirmation {"123456"}
    lionmail { "aa1000@columbia.edu" }
    time_slot { "Monday" }
  end
end