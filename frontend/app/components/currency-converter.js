import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['currency-converter'],
  currencies: Ember.inject.service(),
  dateRange: Ember.inject.service(),
  codes: Ember.computed.alias('currencies.codes'),
  minDate: Ember.computed('dateRange.starting',function() {
    return new Date(Date.parse(this.get('dateRange.starting')));
  }),
  maxDate: Ember.computed('dateRange.starting',function() {
    return new Date(Date.parse(this.get('dateRange.ending')));
  }),
  selectedDate:Ember.computed('date',function() {
    return new Date(Date.parse(this.get('date')));
  }),
  today: Ember.computed(function() {
    return new Date();
  }),
  actions: {
    chooseFromCurrency(currency) {
      this.set('from', currency);
    },
    chooseToCurrency(currency) {
      this.set('to', currency);
    },
    setDate(date) {
      this.set('date', strftime('%Y-%m-%d', date));
    }
  }
});
