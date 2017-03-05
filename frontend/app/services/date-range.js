import Ember from 'ember';

export default Ember.Service.extend({
  init() {
    const self = this;
    Ember.$.getJSON({ url: "/api/date_range", type: "GET" }).then(function(result) {
      self.set('starting', result.starting);
      self.set('ending', result.ending);
    });
  }
});
