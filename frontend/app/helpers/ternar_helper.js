import Ember from 'ember';

export default Ember.Handlebars.registerHelper('ternary', function(test, yes, no) {
  return test ? yes : no;
});