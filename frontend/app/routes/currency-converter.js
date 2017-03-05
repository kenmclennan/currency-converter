import Ember from 'ember';

export default Ember.Route.extend({
  queryParams: {
    date:   { refreshModel: true },
    from:   { refreshModel: true },
    to:     { refreshModel: true },
    amount: { refreshModel: true }
  },
  model(params) {
    return Ember.$.getJSON({ url: "/api/currency_conversion", type: "GET", data: params }).then(function(result) {
      return result;
    });
  },
});
