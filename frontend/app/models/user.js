import DS from "ember-data";

var User = DS.Model.extend({
  full_name: DS.attr('string'),
  email: DS.attr('string'),
  password: DS.attr('string'),
  passwordConfirmation: DS.attr('string'),
  categgory: DS.belongsTo('categgory'),
  categgories_with_subjects: DS.hasMany('categgories_with_subject')
});

// User.reopenClass({
//   FIXTURES: [
//   // id:7 name: 'lalalalal'
//       { "id": "14", full_name: 'sdgfds@dsfgfsd.com', email: 'sdgfds@dsfgfsd.com', admin: null, "category": {"id": "7", "name": "sddsss"} },
//       { id: 2, firstName: 'Tom' , lastName: 'Dale'     }
//   ]
// });

export default User;