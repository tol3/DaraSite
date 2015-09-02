PumaWorkerKiller.start

PumaWorkerKiller.config do |config|
  config.ram           = 4096# mb
  config.frequency     = 30    # seconds
  config.percent_usage = 0.80
end