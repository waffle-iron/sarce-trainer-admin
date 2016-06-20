class QuestionService
  def initialize(question)
    @question = question
  end

  # TODO: (fabienalbi) maybe move this method into presenter
  def find_correct_count
    GivenAnswer.where(question_id: @question.id, is_correct: true).count
  end
end
