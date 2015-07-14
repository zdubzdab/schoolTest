import DS from "ember-data";

export default DS.Model.extend({
  full_name: DS.attr('string'),
  email: DS.attr('string'),
  password: DS.attr('string'),
  passwordConfirmation: DS.attr('string'),
  klass: DS.belongsTo('klass')
});