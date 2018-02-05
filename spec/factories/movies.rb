# Copy this file into your spec/support folder; create one if you don't have it.
# https://github.com/firstdraft/increasing_random/blob/master/increasing_random.rb

require Rails.root.join("spec", "support", "increasing_random.rb")

FactoryGirl.define do
  factory :movie do
    sequence(:id, IncreasingRandom.new) { |n| n.value }
    sequence(:title, IncreasingRandom.new) { |n| "Some fake title #{n}" }
    sequence(:description, IncreasingRandom.new) { |n| "Some fake description #{n}" }
    favorite false
  end
end
