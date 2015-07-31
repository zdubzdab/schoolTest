import DS from "ember-data";

export default DS.Model.extend({
  user: DS.belongsTo('string'),
  answer_setting: DS.belongsTo('answer_setting')
});

  // belongs_to :user
  // belongs_to :answer_setting