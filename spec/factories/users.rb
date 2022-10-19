FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n}@sample.com" }
    sequence(:name) { |n| "test-user#{n}" }
    sequence(:postal_code) { |n| "#{n.to_s * 3}-#{n.to_s * 4}"}
    address { 'Tokyo' }
    self_introduction { 'Hello' }
    password { "dottle-nouveau-pavilion-tights-furze" }
  end
end
