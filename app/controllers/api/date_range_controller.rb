class Api::DateRangeController < ApplicationController
  def index
    repository = ExchangeRate.repository
    starting, ending = repository.date_range
    render json: { starting: starting, ending: ending }
  end
end
