import Ember from 'ember';
import EmberValidations from 'ember-validations';

var RegistrationUserMixin = Ember.Mixin.create(EmberValidations.Mixin, {
  validations: {
    full_name: {
      presence: true,
      length: { minimum: 5 }
    },
    email: {
      presence: true,
      format: { with: /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i, allowBlank: true }
    },
    password: {
      confirmation: true,
      length: {minimum: 8}
    },
    passwordConfirmation: {
      presence: {
        message: ' Please confirm your password'
      }
    },
    klass: {
      presence: true
    }
  },

  registerUser: function(){
    var _this = this;
    var user = this.get('model');

    _this.validate().then(function() {
      user.save().then(
        function() {
          console.log('aftersave');
        }.bind(this), function(error) {
          console.log(error);
        });
    }).catch(function() {
      user.get('errors').clear();
      $.each( Ember.keys(user.toJSON()), function( index, value ) {
        user.get('errors').add( value, _this.get('errors')[value] );
      });
      _this.get('errors');
    }).finally(function() {
        // all validations complete
      // regardless of isValid state
    });

    // var user = this.store.createRecord('user', {
    //   email: email,
    //   password: password
    // });

    // user.save();
  }
})

export default RegistrationUserMixin;