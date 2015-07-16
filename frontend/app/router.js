import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('login');
  this.route('registration');
  // protected route that's inaccessible without authentication
  this.route('protected');

  this.route('tests');
});

export default Router;
