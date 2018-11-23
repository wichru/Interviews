class AddAnswerToQuestion
  def initialize(questionnaire:, question:, answer:)
    @questionnaire = questionnaire
    @question = question
    @answer = answer
  end

  def call
    raise StandardError unless @questionnaire.questions.include?(@question)
    @question.answer = @answer
  end
end
