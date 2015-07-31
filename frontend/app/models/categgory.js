import DS from "ember-data";

var Categgory = DS.Model.extend({
  name: DS.attr('string'),
  subjects: DS.hasMany('subject')
});

// NOTICE: fixtures block.Remove in a future.
// Categgory.reopenClass({
//   FIXTURES: [
//     {
//       id: 7,
//       name: "seven Class",
//     },
//     {
//       id: 2,
//       name: "Second Class",
//     }
//   ]
// });

export default Categgory;