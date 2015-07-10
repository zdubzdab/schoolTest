import DS from "ember-data";
import Ember from "ember";

var ApplicationAdapter = DS.ActiveModelAdapter.extend({
  namespace: 'api',
  pathForType: function(modelName) {
    var decamelized = Ember.String.decamelize(modelName);
    return Ember.String.pluralize(decamelized);
  },
  init: function() {
    this._super();
    this.headers = {
      'X-CSRF-Token': Ember.$('meta[name="csrf-token"]').attr('content')
    }
  }
});

// app adapter for fixtures
// var ApplicationAdapter = DS.FixtureAdapter.extend({});

export default ApplicationAdapter;