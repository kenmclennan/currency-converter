# README

A demo web app for [the exchange-rate gem](https://github.com/kenmclennan/exchange-rate)

## prerequisites

Tha backend is a Rails 5 app, built with ruby 2.3.

The frontend is a single page Ember.js app. To install ember-cli you will need node & npm.
To check run:

```bash
node --version
npm --version
```

To install Ember

```bash
npm install -g ember-cli@2.11
```

Further details can be found at [https://guides.emberjs.com/v2.11.0/getting-started](https://guides.emberjs.com/v2.11.0/getting-started)

## Installation & setup

```bash
git clone https://github.com/kenmclennan/currency-converter

cd currency-converter

bundle install

rake exchange_rates:update

rake ember:install
rake ember:compile

rails s
```

Then open your browser at [http://localhost:3000](http://localhost:3000)

