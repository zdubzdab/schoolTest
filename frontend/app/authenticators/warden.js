import Ember from "ember";
import SimpleAuthBase from "simple-auth/authenticators/base";

export default SimpleAuthBase.extend({
  serverTokenEndpoint: '/api/v1/users/sign_in',
  resourceName: 'user',
  tokenAttributeName: 'token',
  identificationAttributeName: 'email',

  restore: function(data) {
    var _this            = this;
    var propertiesObject = Ember.Object.create(properties);
    return new Ember.RSVP.Promise(function(resolve, reject) {
      if (!Ember.isEmpty(propertiesObject.get(_this.tokenAttributeName)) && !Ember.isEmpty(propertiesObject.get(_this.identificationAttributeName))) {
        resolve(properties);
      } else {
        reject();
      }
    });
  },

  authenticate: function(credentials) {
    var _this = this;
    return new Ember.RSVP.Promise(function(resolve, reject) {
      var data                 = {};
      data[_this.resourceName] = {
        password: credentials.password
      };
      data[_this.resourceName][_this.identificationAttributeName] = credentials.identification;

      _this.makeRequest(data).then(function(response) {
        Ember.run(function() {
          resolve(response);
        });
      }, function(xhr, status, error) {
        Ember.run(function() {
          reject(xhr.responseJSON || xhr.responseText);
        });
      });
    });
  },

  invalidate: function() {
    // do nothing
    return Ember.RSVP.resolve();
  },

  makeRequest: function(data, resolve, reject) {
    return Ember.$.ajax({
      url:        this.serverTokenEndpoint,
      type:       'POST',
      data:       data,
      dataType:   'json',
      beforeSend: function(xhr, settings) {
        xhr.setRequestHeader('Accept', settings.accepts.json);
      }
    });
  }
});