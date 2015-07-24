import Ember from "ember";
import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin';

export default Ember.Route.extend(ApplicationRouteMixin, {
  beforeModel() {
    if (this.session.isAuthenticated) {
      return this._populateCurrentUser();
    }
  },

  _populateCurrentUser() {
    var self = this;
    var session = self.get('session.secure');
    var user;
    const user_id = session.user_id;

    self.store.find('user', user_id)
      .then( function(data){
        return self.get('currentUser').set('content', data);
      }.bind(self), function(error){
        console.log(error.stack);
      });
  },

  currentUserIsAdmin: function(){
    return this.get('currentUser').admin === true;
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