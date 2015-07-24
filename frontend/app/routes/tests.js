import Ember from "ember";

export default Ember.Route.extend({
  model: function() {
    return Ember.RSVP.hash({
      // TODO: select tests based on category
      // after change selectbox with subject show tests

      // tests: this.store.find('test').then(function(klasses){
      //   return klasses.filterBy('isNew', false);
      // })
    });
  },

  setupController: function(controller, model) {
    // controller.set('klasses', model.klasses);
  }
});