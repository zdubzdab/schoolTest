module TestHelper
  def answers_for_question(test, question_id)
    test.answers.select{|ta| ta.answer_setting.question.id == question_id}
  end

  def add_pers_to_result(result)
    result.to_s.concat '%'
  end
end
