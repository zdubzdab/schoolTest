import Ember from 'ember';
import RegistrationUserMixin from "frontend/mixins/registration";
import EmberValidations from 'ember-validations';

export default Ember.ObjectController.extend(RegistrationUserMixin, {
  selectedKlass: '',

  klasses: function() {
    return this.get('klasses');
  },

  actions: {
    registration: function(){
      this.registerUser.apply(this);
    }
  }
});