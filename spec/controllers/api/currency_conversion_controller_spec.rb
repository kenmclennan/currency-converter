require 'rails_helper'

RSpec.describe Api::CurrencyConversionController, type: :controller do
  before do
    ExchangeRate.repository.truncate!
    ExchangeRate.repository.create({ date: Date.today, code: 'EUR', rate: '1.0'})
    ExchangeRate.repository.create({ date: Date.today, code: 'GBP', rate: '1.25'})
  end

  let(:params) { { date: Date.today, from: 'GBP', to: 'EUR', amount: 1000 } }

  describe "GET #index" do
    context 'when there is data' do
      it 'performas a currency conversion and returns the result' do
        get :index, params: params
        expect(response).to have_http_status(:success)
        expect(response.body).not_to be :empty
        data = JSON.parse(response.body)
        expect(data['amount']).to eq('800.00')
        expect(data['currency']).to eq('EUR')
        expect(data['exchange_rate']).to eq('0.8000')
      end
    end

    context 'when there is no data' do
      it 'returns an error' do
        get :index, params: params.merge!(date: (Date.today + 1))
        expect(response).to have_http_status(:success)
        expect(response.body).not_to be :empty
        data = JSON.parse(response.body)
        expect(data['error']).to eq('Could not find exchange rate data for GBP at %s' % params[:date])
      end
    end

    context 'when there are missing params' do
      it 'returns an error' do
        get :index, params: {}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
