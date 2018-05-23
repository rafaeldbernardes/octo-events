FactoryBot.define do
  factory :event do
    action  { Faker::Name.name }
    issue   nil
  end
end