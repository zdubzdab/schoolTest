import DS from "ember-data";

export default DS.RESTAdapter.extend({
  pathForType: function(modelName) {
    var decamelized = Ember.String.decamelize(modelName);
    return Ember.String.pluralize(decamelized);
  },
  init: function() {
    this._super();
    this.headers = {
      'X-CSRF-Token': decodeURIComponent(Ember.get(document.cookie.match(/XSRF\-TOKEN\=([^;]*)/), "1"))
    };
  }

});