import Ember from 'ember';
import EmberValidations from 'ember-validations';
// import LoginControllerMixin from 'simple-auth/mixins/login-controller-mixin';

export default Ember.ObjectController.extend(EmberValidations.Mixin, {
  authenticator: 'simple-auth-authenticator:devise',
  selectedKlass: '',
  klasses: function() {
    return this.get('klasses');
  },

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


  actions: {
    registration: function(){
      var _this = this;
      var user = this.get('model');

      _this.validate().then(function() {
        user.save().then(
          function() {
            _this.get('session').authenticate('simple-auth-authenticator:devise', {
              identification: _this.get('email'),
              password: _this.get('password')
            });
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
    },

    successAuth: function(){
      var credentials = this.getProperties('identification', 'password');
      this.get('session').authenticate('simple-auth-authenticator:devise', credentials);
      this.transitionToRoute('index');
    },

    falseAuth: function(){
      // handle error
    }
  },

  selectedKlassDidChange: function(){
    this.get('model').get('klass').set('id', this.get('selectedKlassId'));
  }.observes('selectedKlass')
});