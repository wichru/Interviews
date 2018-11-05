FactoryBot.define do
  factory :questionnaire do
    sequence(:name) { |i| "Questionnaire #{i}" }
  end
end
