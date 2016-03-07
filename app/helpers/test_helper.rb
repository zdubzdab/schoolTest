module TestHelper
  def answers_for_question(test, question_id)
    test.answers.select{|ta| ta.answer_setting.question.id == question_id}
  end

  def add_pers_to_result(result)
    "#{result}%"
  end

  def count_attempts_number(tried_number, attempts_number)
    tried_number - attempts_number
  end

end
