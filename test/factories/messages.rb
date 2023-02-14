FactoryBot.define do
  factory :message do
    convo { nil }
    user { nil }
    content { "MyString" }
  end
end
