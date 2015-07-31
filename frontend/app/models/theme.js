import DS from "ember-data";

export default DS.Model.extend({
  name: DS.attr('string'),
  test_settings: DS.hasMany('test_setting'),
  subject: DS.belongsTo('subject'),
  tests: DS.hasMany('test')
});


  // belongs_to :subject
  // has_many :tests

// create_table "themes", force: :cascade do |t|
//     t.string   "name"
//     t.integer  "subject_id"
//     t.datetime "created_at", null: false
//     t.datetime "updated_at", null: false
//   end