import Ember from "ember";

Ember.Route.extend({
  actions: {
    authenticate: function() {
      var credentials = this.getProperties('first_name', 'last_name', 'password');
      this.get('session').authenticate('simple-auth-authenticator:warden', credentials);
    }
    // action to trigger authentication with Facebook
    // authenticateWithFacebook: function() {
    //   this.get('session').authenticate('simple-auth-authenticator:torii', 'facebook-oauth2');
    // },
    // action to trigger authentication with Google+
    // authenticateWithGooglePlus: function() {
    //   this.get('session').authenticate('simple-auth-authenticator:torii', 'google-oauth2');
    // }
  }
});