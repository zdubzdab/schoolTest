module QuestionHelper
  def answers_from_question (array)
    array.map! { |a| a.name }
    array.join('')
  end
end
