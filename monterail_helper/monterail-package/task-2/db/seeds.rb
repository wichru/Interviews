3.times do
  questionnaire = Questionnaire.create!(name: Faker::GameOfThrones.city)

  2.times do
    question = Question.create!(content: Faker::TwinPeaks.quote)
    QuestionnaireQuestion.create!(question: question, questionnaire: questionnaire, answer: "yes")
  end

  question = Question.create!(content: Faker::TwinPeaks.quote)
  QuestionnaireQuestion.create!(question: question, questionnaire: questionnaire, answer: "no")

  question = Question.create!(content: Faker::TwinPeaks.quote)
  QuestionnaireQuestion.create!(question: question, questionnaire: questionnaire)
end
