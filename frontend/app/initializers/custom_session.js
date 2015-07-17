import Ember from "ember";
import Session from "simple-auth/session";

export default {
  name: "custom-session",
  before: "simple-auth",
  initialize: function(container) {
    Session.reopen({
      setCurrentUser: function() {
        // var email = JSON.parse(localStorage.getItem('ember_simple_auth:session')).secure.email;
        console.log('custom-session');
        var id = JSON.parse(localStorage.getItem('ember_simple_auth:session')).secure.user_id
        if( !Ember.isEmpty(id) ){
          return container.lookup("store:main").find("user", id ).then(function(user) {
            self.set("currentUser", user);
          });
        }
      }.observes("user_id")
    });
  }
};