import DS from "ember-data";

export default DS.Model.extend({
  test_setting: DS.belongsTo('test_setting'),
  user: DS.belongsTo('user'),
  theme: DS.belongsTo('theme')
});

  // belongs_to :test_setting
  // belongs_to :user
  // has_one :theme, through: :test_setting

  // eate_table "tests", force: :cascade do |t|
  //   t.datetime "created_at",      null: false
  //   t.datetime "updated_at",      null: false
  //   t.integer  "test_setting_id"
  //   t.integer  "user_id"
  // end