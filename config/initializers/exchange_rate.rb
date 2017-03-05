ExchangeRate.configure do |conf|
  conf.pstore_path = File.join(Rails.root,'data',"exchange_rates_#{Rails.env}.pstore")
end