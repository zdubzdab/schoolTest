import DS from "ember-data";

export default DS.Model.extend({
  // validations: {
  //   text: {
  //     presence: true,
  //     length: { minimum: 3 }
  //   }
  // },
  text: DS.attr('string'),
  test_setting: DS.belongsTo('test_setting'),
  answer_settings: DS.hasMany('answer_setting')
});