import DS from "ember-data";

var Subject = DS.Model.extend({
  name: DS.attr('string'),
  categgory: DS.belongsTo('categgory'),
  created_at: DS.attr('date'),
  updated_at: DS.attr('date')
});

// NOTICE: fixtures block.Remove in a future.
// Subject.reopenClass({
//   FIXTURES: [
//     {
//       id: 7,
//       name: "biology",
//     },
//     {
//       id: 2,
//       name: "chemistry",
//     }
//   ]
// });

export default Subject;