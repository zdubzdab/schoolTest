import Ember from 'ember';

export default Ember.Controller.extend( {
  testsSettingsIsShowed: false,

  resetSubjects: function(){
    this.set('subject', null);
  },

  returnTestSettings: function(){
    var self = this;
    var test_settings = [];
    $.ajax({
      url: "/get_test_settings",
      data: {subject_id: self.get('subject').get('id'), categgory_id: self.get('categgory').get('id')}
    }).then(function(response) {
      if( Ember.isEmpty( response['/'] ) ){
        return false;
      }else{
        test_settings = response['/'];
      if(test_settings){
        self.set('testsSettingsIsShowed', true);
        self.set('test_settings', test_settings);
      }
      }
    });
  },

  watchCateggory: function() {
    var self = this; 
    if( Ember.isEmpty(this.get('categgory')) ){
      self.set('testsSettingsIsShowed', false);
      this.resetSubjects();
      return false;
    }
    if( !Ember.isEmpty(this.get('categgory')) && !Ember.isEmpty(this.get('subject')) ){
      return this.returnTestSettings();
    }
  }.observes('categgory'),

  watchSubject: function() {
    var self = this; 
    if( Ember.isEmpty(this.get('categgory')) || Ember.isEmpty(this.get('subject')) ){
      self.set('testsSettingsIsShowed', false);
      return false;
    }else{
      return this.returnTestSettings();
    }
  }.observes('subject'),

  actions: {
    editTestSetting: function(test_setting){
      this.transitionTo('test_settings.edit', test_setting);
    }
  }

});