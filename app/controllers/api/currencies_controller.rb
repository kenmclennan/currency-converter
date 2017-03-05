class Api::CurrenciesController < ApplicationController
  def index
    repository = ExchangeRate.repository
    currencies = repository.currency_codes
    render json: { currencies: currencies }
  end
end
