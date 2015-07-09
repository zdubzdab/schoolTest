import DS from "ember-data";
import Ember from "ember";

var ApplicationAdapter = DS.ActiveModelAdapter.extend({
  namespace: 'api/v1',
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

export default ApplicationAdapter;