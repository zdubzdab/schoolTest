import DS from 'ember-data';

export default DS.RESTSerializer.extend(DS.EmbeddedRecordsMixin, {
  attrs: {
    "categgory": { embedded: 'always' },
    "subject": { embedded: 'always' }

  }
});