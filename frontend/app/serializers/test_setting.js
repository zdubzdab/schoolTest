import DS from 'ember-data';

export default DS.RESTSerializer.extend(DS.EmbeddedRecordsMixin, {
  attrs: {
    "theme": { embedded: 'always' },
    "questions": { embedded: 'always' },
    "categgory": { embedded: 'always' },
    "subject": { embedded: 'always' }
  },

  serializeHasMany: function(record, json, relationship) {
    var key = relationship.key;

    var relationshipType = record.constructor.determineRelationshipType(relationship);

    if (relationshipType === 'manyToNone' || relationshipType === 'manyToMany' || relationshipType === 'manyToOne') {
      //NOTE: format ids for Rails API
      if(Ember.get(record, key)){
        json[Ember.String.singularize(key)] = Ember.get(record, key).mapBy('id');
      }
    }
  }
});