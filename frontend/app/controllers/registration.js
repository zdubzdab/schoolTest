import Ember from 'ember';

export default Ember.ObjectController.extend({
  klasses: function() {
    return this.get('klasses');
  },

  actions: {
    registration: function(){
      var user = this.get('user');

      debugger;

      // var user = this.store.createRecord('user', {
      //   email: email,
      //   password: password
      // });

      // user.save();
    }
  }
});