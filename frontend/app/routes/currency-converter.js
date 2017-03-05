import Ember from 'ember';

export default Ember.Route.extend({
  queryParams: {
    date:   { refreshModel: true },
    from:   { refreshModel: true },
    to:     { refreshModel: true },
    amount: { refreshModel: true }
  },
  model(params) {
    if (params.from && params.to && params.amount) {
      return Ember.$.getJSON({ url: "/api/currency_conversion", type: "GET", data: params }).then(function(result) {
        return result;
      }).catch(function(){
        return {};
      });
    }
    else {
      return {};
    }
  },
});
