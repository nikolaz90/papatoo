FactoryBot.define do
  factory :game_score do
    score { 1 }
    game_name { "MyString" }
    user { nil }
  end
end
