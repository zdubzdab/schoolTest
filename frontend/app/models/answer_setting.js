import DS from "ember-data";

export default DS.Model.extend({
  name: DS.attr('string'),
  rigth: DS.attr('boolean'),
  few_answers: DS.attr('boolean'),
  question: DS.belongsTo('question'),
  answer: DS.belongsTo('answer')
});