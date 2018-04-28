FactoryBot.define do
  factory :household_meal do
    association :household, factory: :household, strategy: :build     
    meal 
  end
end
