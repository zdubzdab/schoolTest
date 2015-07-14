import Ember from 'ember';
import RegistrationUserMixin from "frontend/mixins/registration";

export default Ember.ObjectController.extend(RegistrationUserMixin, {
  selectedKlass: '',
  klasses: function() {
    return this.get('klasses');
  },

  actions: {
    registration: function(){
      this.registerUser.apply(this);
    }
  },

  selectedKlassDidChange: function(){
    this.get('model').get('klass').set('id', this.get('selectedKlassId'))
  }.observes('selectedKlass')
});