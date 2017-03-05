namespace :exchange_rates do
  desc 'pull data from data source'

  task update: :environment do
    data_source = ExchangeRate.data_source
    repository  = ExchangeRate.repository
    data_source.update(repository)
  end

  task truncate: :environment do
    ExchangeRate.repository.truncate!
  end
end