import Ember from "ember";

export default Ember.Route.extend({
  model: function() {
    return Ember.RSVP.hash({
      klasses: this.store.findAll('klass')
    });
  },

  actions: {
    registration: function() {
      
      // var credentials = this.getProperties('identification', 'password');
      // this.get('session').authenticate('simple-auth-authenticator:device', credentials);
    }
  },
  setupController: function(controller, model) {
    controller.set("klasses", model.klasses);
  }
});