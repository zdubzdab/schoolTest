import DS from 'ember-data';


// export default DS.JSONSerializer.reopen({ // or DS.RESTSerializer
//   serializeHasMany: function(record, json, relationship) {
//     var key = relationship.key,
//       hasManyRecords = Ember.get(record, key);

//     // Embed hasMany relationship if records exist
//     if (hasManyRecords && relationship.options.embedded == 'always') {
//       json[key] = [];
//       hasManyRecords.forEach(function(item, index){
//           json[key].push(item.serialize());
//       });
//     }
//     // Fallback to default serialization behavior
//     else {
//       return this._super(record, json, relationship);
//     }
//   },
//   serializeBelongsTo: function(record, json, relationship) {
//     var key = relationship.key,
//       belongsToRecord = Ember.get(record, key);

//     console.log('serializeBelongsTo');
//     if (relationship.options.embedded === 'always') {
//       json[key] = belongsToRecord.serialize();
//     }
//     else {
//       return this._super(record, json, relationship);
//     }
//   }
// });


export default DS.RESTSerializer.extend(DS.EmbeddedRecordsMixin, {
  attrs: {
    "category": { embedded: 'always', serialize: 'id', deserialize: 'id' }
  }
//   extractSingle: function (store, type, payload, id) {
//     var data = payload.data;

//     var userPayload = {
//       id: data._id,
//       full_name: data.full_name,
//       email: data.email,
//       category: {id: data.category.id}
//     };
//     return this.super(store, type, userPayload, id);
//   }
});