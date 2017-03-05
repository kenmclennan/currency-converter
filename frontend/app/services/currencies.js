import Ember from 'ember';

export default Ember.Service.extend({
  init() {
    const self = this;
    Ember.$.getJSON({ url: "/api/currencies", type: "GET" }).then(function(result) {
      self.set('codes',result.currencies);
    });
  }
});
