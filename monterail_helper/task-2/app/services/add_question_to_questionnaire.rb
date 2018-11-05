class AddQuestionToQuestionnaire
  def initialize(questionnaire:, question:)
    @questionnaire = questionnaire
    @question = question
  end

  def call
    # your code here

    @questionnaire
  end
end
