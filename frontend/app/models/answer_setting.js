import DS from "ember-data";

export default DS.Model.extend({
  name: DS.attr('string'),
  rigth: DS.attr('boolean'),
  question: DS.belongsTo('question'),
  answer: DS.belongsTo('answer')
});

  // has_one :answer
  // belongs_to :question
// t.integer "question_id"
//     t.boolean "rigth"
//     t.string  "name"