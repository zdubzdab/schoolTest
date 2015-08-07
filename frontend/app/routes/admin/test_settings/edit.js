import Ember from "ember";

export default Ember.Route.extend({
  model: function(params) {
    return this.store.find('test_setting', params.test_setting_id );
  },

  setupController: function(controller, model) {
    controller.set('model', model);
  }
});