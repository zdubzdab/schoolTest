import Ember from "ember";

export default Ember.Route.extend({
  model: function() {

    var currentUser = this.get('currentUser');
    var categgories_with_subjects = currentUser.get('categgories_with_subjects')
    // debugger;
    return Ember.RSVP.hash({
      subjects: categgories_with_subjects.mapBy('subject'),
      own_classes: categgories_with_subjects.mapBy('categgory')
    });
  },

  setupController: function(controller, model) {
    controller.set('subjects', model.subjects);
    controller.set('own_classes', model.own_classes);
  }
});