class QuestionnaireReport
  def initialize(questionnaire)
    @questionnaire = questionnaire
  end

  def call
    report = {
      'yes' => 0,
      'no' => 0,
      'not_answered' => 0
    }

    @questionnaire.questions.each do |question|
      if question.answer&.value == 'yes'
        report['yes'] += 1
      elsif question.answer&.value == 'no'
        report['no'] += 1
      else
        report['not_answered'] += 1
      end
    end

    {
      @questionnaire.name => report
    }
  end
end
