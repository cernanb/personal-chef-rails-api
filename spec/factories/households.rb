FactoryBot.define do
  factory :household do
    user
    name {"Bernardo"}
    address {"123 Main St"}
    monthly_rate {1000}
  end
end
