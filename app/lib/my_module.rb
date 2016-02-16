module MyModule
   def count_and_paste_test_result_into_test_table
    create_hash_with_key_question_id_and_value_number_of_answers
    create_array_with_question_id_that_has_true_answ
    pull_true_answers_from_questions_with_one_answer
    count_and_paste_test_result
   end

  def create_hash_with_key_question_id_and_value_number_of_answers
    test_answers = self.answers
                        .where( answers: {checked: 'true'} )
                        .group_by(&:question_id)
    array1 = test_answers.map {|k,v| [k, v.length]}
    array_with_question_id_and_answers_number = array1.flatten
    hash_with_question_id_and_answers_number = Hash[*array_with_question_id_and_answers_number]
    @result_from_2_method = hash_with_question_id_and_answers_number.select {|k,v| v > 1}
  end

  def create_array_with_question_id_that_has_true_answ
    @true_answers = Answer.belongs_to_current_test(self.id)
                          .with_true
                          .joins(:answer_setting)
                          .where( answer_settings: {rigth: 'true'} )
    @result_from_3_method = @true_answers.map{ |t_a| t_a.question_id }
  end

  def pull_true_answers_from_questions_with_one_answer
    array_with_number_of_tries_bigger_1 = @result_from_2_method.map {|k,v| k}
    array_with_number_common_elements = array_with_number_of_tries_bigger_1 & @result_from_3_method
    @result_from_4_method = @true_answers.count - array_with_number_common_elements.size
  end

  def count_and_paste_test_result
    all_questions = self.test_setting.questions
    test_result = Float(@result_from_4_method.to_i) / (all_questions.count.nonzero? || 1) * 100
    self.update_attributes(complete_pers: test_result)
  end
end
