import DS from "ember-data";
import Ember from "ember";

// var ApplicationAdapter = DS.ActiveModelAdapter.extend({
//   pathForType: function(modelName) {
//     var decamelized = Ember.String.decamelize(modelName);
//     return Ember.String.pluralize(decamelized);
//   }
// });

// app adapter for fixtures
var ApplicationAdapter = DS.FixtureAdapter.extend({});

export default ApplicationAdapter;