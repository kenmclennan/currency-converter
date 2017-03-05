require 'rails_helper'

RSpec.describe Api::DateRangeController, type: :controller do
  before do
    ExchangeRate.repository.truncate!
    ExchangeRate.repository.create({ date: Date.today, code: 'EUR', rate: '1.0'})
    ExchangeRate.repository.create({ date: Date.today, code: 'GBP', rate: '1.25'})
  end

  describe "GET #index" do
    it 'gets a list of known currencies' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response.body).not_to be :empty
      data = JSON.parse(response.body)
      expect(data['starting']).to match(/\d{4}\-\d{2}\-\d{2}/)
      expect(data['ending']).to match(/\d{4}\-\d{2}\-\d{2}/)
    end
  end
end
