FactoryBot.define do
  factory :questionnaire_question do
    questionnaire
    question
    sequence(:place) { |i| i }
  end
end
