import Ember from 'ember';

export default Ember.ObjectController.extend({
  currentUserLink: function () {
    return 'tests';
  },
  currentUserIsAdmin: function(){
    return this.get('currentUser').admin === true;
  }
});