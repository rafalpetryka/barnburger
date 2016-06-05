FactoryGirl.define do
  factory :opening_hour do
    place 'zgoda'
    monday ['1200', '2200', '2130']
    tuesday ['1200', '2200', '2130']
    wednesday ['1200', '2200', '2130']
    thursday ['1200', '2200', '2130']
    friday ['1200', '2200', '2130']
    saturday ['1300', '2200', '2130']
    sunday ['1300', '2100', '2030']
  end
end
