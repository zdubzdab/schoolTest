import Ember from "ember";

export default Ember.Route.extend({
  actions: {
    authenticate: function() {
      console.log('authenticate');
      var credentials = this.getProperties('identification', 'password');
      this.get('session').authenticate('simple-auth-authenticator:device', credentials);
    }
  }
});