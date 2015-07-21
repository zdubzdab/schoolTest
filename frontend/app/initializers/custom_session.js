import Ember from "ember";
// import Session from "simple-auth/session";

export default {
  // name: "custom-session",
  // before: "simple-auth",
  // initialize: function(container) {
  //   Session.reopen({
  //     setCurrentUser: function() {
  //       // var email = JSON.parse(localStorage.getItem('ember_simple_auth:session')).secure.email;
  //       var self = this;
  //       var id = JSON.parse(localStorage.getItem('ember_simple_auth:session')).secure.user_id
  //       if( !Ember.isEmpty(id) ){
  //         return container.lookup("store:main").find("user", id ).then(function(user) {
  //           self.set("currentUser", user);
  //           console.log('after set cur user');
  //         });
  //       }
  //     }
  //   });
  // }
  name: "current-user",

  initialize: function(registry) {
    const service = Ember.ObjectProxy.create({ isServiceFactory: true });
    registry.register('service:current-user', service, { instantiate: false, singleton: true });
    registry.injection('route', 'currentUser', 'service:current-user');
    registry.injection('controller', 'currentUser', 'service:current-user');
    registry.injection('component', 'currentUser', 'service:current-user');
  }
};