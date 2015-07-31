import DS from "ember-data";

var TestSetting = DS.Model.extend({
  complete_pers: DS.attr('integer'),
  max_tried_count: DS.attr('integer'),
  description: DS.attr('string'),
  time_to_pass: DS.attr('datetime'),
  theme: DS.belongsTo('theme'),
  name: DS.attr('string'),
  tests: DS.hasMany('test'),
  questions: DS.hasMany('question'),
  subject: DS.belongsTo('subject'),
  categgory: DS.belongsTo('categgory')
});

export default TestSetting;

  // has_many :tests
  // has_many :questions
  // belongs_to :subject
  // belongs_to :categgory
  // belongs_to :theme
