class RemoveQuestionFromQuestionnaire
  def initialize(questionnaire:, question:)
    @questionnaire = questionnaire
    @question = question
  end

  def call
    # @questionnaire.questions.destroy(question)
    if @questionnaire.questions.include?(@question)
      @questionnaire.questions.delete(@question)
      @question.delete
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
