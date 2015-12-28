module MyModule
  def count_and_paste_result_into_test_table
    #creation_hash_with_key_question_id_and_value_number_of_answers
    test_answers = self.answers
                                .where( answers: {checked: 'true'} )
                                .group_by(&:question_id)
    array1 = []
    array1 = test_answers.map {|k,v| [k, v.length]}
    array_with_question_id_and_answers_number = array1.flatten
    hash_with_question_id_and_answers_number = Hash[*array_with_question_id_and_answers_number]
    hash_with_number_of_tries_bigger_1 = hash_with_question_id_and_answers_number.select {|k,v| v > 1}

    #creation_array_with_question_id_that_has_true_answ
    true_answers = Answer.belongs_to_current_test(self.id)
                          .with_true
                          .joins(:answer_setting)
                          .where( answer_settings: {rigth: 'true'} )

    array_question_id_with_true_answ = []
    true_answers.each do |t_a|
      array_question_id_with_true_answ << t_a.question_id
    end

    #searching_true_answers_without_cheats
    array_with_number_of_tries_bigger_1 = hash_with_number_of_tries_bigger_1.map {|k,v| k}
    array_with_number_common_elements = array_with_number_of_tries_bigger_1 & array_question_id_with_true_answ
    true_answers_without_cheats = true_answers.count - array_with_number_common_elements.size

    #counting_test_result
    all_questions = self.test_setting.questions
    test_result = Float(true_answers_without_cheats) / (all_questions.count.nonzero? || 1) * 100
    self.update_attributes(complete_pers: test_result)
  end
end
