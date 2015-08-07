// max_tried_count: DS.attr('number'),
// description: DS.attr('string'),
// time_to_pass: DS.attr('date'),
// theme: DS.belongsTo('theme'),
// name: DS.attr('string'),
// tests: DS.hasMany('test'),
// questions: DS.hasMany('question'),
// subject: DS.belongsTo('subject'),
// categgory: DS.belongsTo('categgory')

// answer setting
// name: DS.attr('string'),
//   rigth: DS.attr('boolean'),
//   few_answers: DS.attr('boolean'),
//   question: DS.belongsTo('question'),
//   answer: DS.belongsTo('answer')

import Ember from 'ember';
import EmberValidations from 'ember-validations';

export default Ember.ObjectController.extend(EmberValidations.Mixin, {
  questions: Ember.computed.alias("model.questions"),

  validations: {
    description: {
      presence: true,
      length: { minimum: 10 }
    },

    max_tried_count: {
      numericality: {onlyInteger: true, greaterThan: 0}
    },

    // time_to_pass:{
    //   numericality: true
    // },

    theme:{
      presence: true
    },

    name: {
      presence: true,
      length: { minimum: 3 }
    }
    // ,

    // 'questions.text': {
    //   presence: true,
    //   length: { minimum: 3 }
    // }

    // 'question.text': {
    //   presence: true,
    //   length: { minimum: 3 }
    // },

    // // TODO: add more validation for AS
    // 'answer_setting.name': {
    //   presence: true,
    //   length: { minimum: 3 }
    // }
  },

  actions: {
    addQuestion: function(test_setting){
      // var question = this.store.createRecord('question', {test_setting: test_setting});
      // test_setting.get('questions').addObject(question);
      // this.set('question', question);
    },

    addAnswerSetting: function(question){
      var answer_setting = this.store.createRecord('answer_setting', {question: question});
      this.set('answer_setting', answer_setting);
    },

    submitTestSetting: function(){
      var _self = this;
      var test_setting = _self.get('model');
      _self.validate().then(function() {
        // all validations pass
        // _self.send('closeTransactionForm');
        test_setting.save().then(
          function() {
            console.log('aftersave');
          }.bind(this), function(error) {
            console.log(error);
          });
      }).catch(function() {
        // test_setting.transitionTo('loaded.saved');
        // debugger;
        $.each( Ember.keys( test_setting.toJSON()), function( index, value ) {
          test_setting.get('errors').add( value, _self.get('errors')[value] );
        });

        // $.each( test_setting.get('questions'), function(index, value){

        //   console.log(value.text);
        // });

        // _self.get('errors');
      })
      }
  }
})

// addTag: function(money_transaction){
//       console.log('addTag');
//       money_transaction.set('isAddTag', true);
//       var newTag = this.store.createRecord('tag');
//       newTag.get('money_transactions').addObject(money_transaction);
//       this.set('newTag', newTag);
//     }

// validations: {
//     full_name: {
//       presence: true,
//       length: { minimum: 5 }
//     },
//     email: {
//       presence: true,
//       format: { with: /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i, allowBlank: true }
//     },
//     password: {
//       confirmation: true,
//       length: {minimum: 8}
//     },
//     passwordConfirmation: {
//       presence: {
//         message: ' Please confirm your password'
//       }
//     },
//     categgory: {
//       presence: true
//     }
//   },