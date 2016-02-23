module TestResultCalculation
  class CountResult
    attr_reader :test

    def initialize(test)
      @test = test
    end

    def count_and_paste_test_result
      all_questions = test.test_setting.questions
      test_result = Float(pull_true_answers_from_questions_with_one_answer) / (all_questions.count.nonzero? || 1) * 100
      test.update_attributes(complete_pers: test_result)
    end

      private
      def create_hash_with_key_question_id_and_value_number_of_answers
        test_answers = test.answers
                            .where( answers: {checked: 'true'} )
                            .group_by(&:question_id)
        array_with_question_id_and_answers_number = test_answers.map {|k,v| [k, v.length]}.flatten
        hash_with_question_id_and_answers_number = Hash[*array_with_question_id_and_answers_number].select {|k,v| v > 1}
      end

      def create_array_with_question_id_that_has_true_answ
        true_answers.map{ |t_a| t_a.question_id }
      end

      def pull_true_answers_from_questions_with_one_answer
        array_with_number_of_tries_bigger_1 = create_hash_with_key_question_id_and_value_number_of_answers.map {|k,v| k}
        array_with_number_common_elements = array_with_number_of_tries_bigger_1 & create_array_with_question_id_that_has_true_answ
        true_answers.count - array_with_number_common_elements.size
      end

      def true_answers
        @true_answers ||= Answer.belongs_to_current_test(test.id)
                                .with_true
                                .joins(:answer_setting)
                                .where( answer_settings: {rigth: 'true'} )
      end
  end
end
