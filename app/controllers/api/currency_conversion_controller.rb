class Api::CurrencyConversionController < ApplicationController
  before_action :check_values

  def index
    date, from, to, amount = values
    convertor = ExchangeRate.at(date, from, to)

    result = convertor.convert(amount).to_h(round: 2).
      merge(exchange_rate: convertor.exchange_rate.to_s)

    render json: result
  rescue ExchangeRate::Storage::RecordNotFound => e
    render json: { error: e.message }
  end

  private
    def values
      [:date,:from,:to,:amount].map { |k| params[k] }
    end

    def check_values
      head(:unprocessable_entity) unless values.all?
    end
end
