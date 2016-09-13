FactoryGirl.define do
  factory :opening_hour do
    place 'zgoda'
    monday %w(1200 2200 2130)
    tuesday %w(1200 2200 2130)
    wednesday %w(1200 2200 2130)
    thursday %w(1200 2200 2130)
    friday %w(1200 2200 2130)
    saturday %w(1300 2200 2130)
    sunday %w(1300 2100 2030)
  end
end
