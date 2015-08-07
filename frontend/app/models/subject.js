import DS from "ember-data";

var Subject = DS.Model.extend({
  name: DS.attr('string')
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