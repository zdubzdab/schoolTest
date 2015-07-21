import Ember from "ember";

export default Ember.Route.extend({
  model: function() {
    var user = this.store.createRecord('user');
    var newKlass = this.store.createRecord('klass');

    return Ember.RSVP.hash({
      klasses: this.store.find('klass').then(function(klasses){
        return klasses.filterBy('isNew', false);
      }),
      user: user
    });
  },

  setupController: function(controller, model) {
    controller.set('klasses', model.klasses);
    controller.set('model', model.user);
  }

  // Cleanup the controller, when you leave the new route so the stale new record is also
  // removed from the store.
  // You can also use https://github.com/dockyard/ember-data-route instead
  // resetController: function (controller, isExiting) {
  //   var model = controller.get('model');

  //   if (!model.get('isDeleted') && isExiting && model.get('isNew')) {
  //     model.deleteRecord();
  //   } else {
  //     model.rollback();
  //   }
  // }

});