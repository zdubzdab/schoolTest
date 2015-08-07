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
  this.resource('admin', function() {
    this.route('test_settings',
      function(){
        this.route('new');
        this.route('show', {path: '/:test_setting_id/show'});
        this.route('edit', {path: '/:test_setting_id/edit'});
    });
  });

  this.route('bad_url', { path: '/*badurl' });
});

export default Router;
