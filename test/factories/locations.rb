FactoryBot.define do
  factory :location do
    long { 1.5 }
    lat { 1.5 }
    start_time { "2023-01-27 12:32:18" }
    duration { 1 }
    user { nil }
  end
end
