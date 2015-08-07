import DS from "ember-data";

var TestSetting = DS.Model.extend({
  name: DS.attr('string'),
  description: DS.attr('string'),
  max_tried_count: DS.attr('number'),
  time_to_pass: DS.attr('number'),

  theme: DS.belongsTo('theme'),
  subject: DS.belongsTo('subject'),
  categgory: DS.belongsTo('categgory'),

  tests: DS.hasMany('test'),
  questions: DS.hasMany('question'),
});

export default TestSetting;

  // has_many :tests
  // has_many :questions
  // belongs_to :subject
  // belongs_to :categgory
  // belongs_to :theme
