import Ember from "ember";
import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin';

export default Ember.Route.extend(ApplicationRouteMixin, {
  beforeModel() {
    var self = this;
    var session = self.get('session.secure');
    var user;
    const user_id = session.user_id;
    if (this.session.isAuthenticated) {

    return self.store.find('user', user_id)
      .then( function(data){
        return self.get('currentUser').set('content', data);
      }.bind(self), function(error){
        console.log(error.stack);
      });
      // return this._populateCurrentUser();
    }
  },

  _populateCurrentUser() {
  },

  actions: {
    sessionAuthenticationSucceeded() {
      this._populateCurrentUser()
      .then(function(data){
        this.transitionTo('index');
      });
    },

    invalidateSession: function() {
      this.get('session').invalidate();
    }
  }
});