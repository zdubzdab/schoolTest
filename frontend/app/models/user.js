import DS from "ember-data";

var User = DS.Model.extend({
  full_name: DS.attr('string'),
  email: DS.attr('string'),
  password: DS.attr('string'),
  passwordConfirmation: DS.attr('string'),
  category: DS.belongsTo('klass', { async: true })
});

User.reopenClass({
  FIXTURES: [
  // id:7 name: 'lalalalal'
      { id: 14, full_name: 'sdgfds@dsfgfsd.com', email: 'sdgfds@dsfgfsd.com', admin: false, category: {id: 7} },
      { id: 2, firstName: 'Tom' , lastName: 'Dale'     }
  ]
});

export default User;
