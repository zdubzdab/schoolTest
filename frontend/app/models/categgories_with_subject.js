import DS from "ember-data";

var OwnClass = DS.Model.extend({
  user: DS.belongsTo('user'),
  categgory: DS.belongsTo('categgory'),
  subject: DS.belongsTo('subject')
});

export default OwnClass;
