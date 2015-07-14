import DS from "ember-data";

var Klass = DS.Model.extend({
  name: DS.attr('string')
});

// NOTICE: fixtures block.Remove in a future.
// Klass.reopenClass({
//   FIXTURES: [
//     {
//       id: 1,
//       name: "First Class",
//     },
//     {
//       id: 2,
//       name: "Second Class",
//     }
//   ]
// });

export default Klass;