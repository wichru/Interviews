class FetchQuestionsFromQuestionnaire
  def initialize(questionnaire)
    @questionnaire = questionnaire
  end

  def call
    @questionnaire.questions.to_a
  end

  # def call
  #
  # end
end
