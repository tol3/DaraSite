workers Integer(ENV['PUMA_WORKERS'] || 1)
threads Integer(ENV['MIN_THREADS']  || 1), Integer(ENV['MAX_THREADS'] || 8)

preload_app!

tag 'Wow2Mouth'

rackup      DefaultRackup
port        ENV['PORT']     || 5000
environment ENV['RACK_ENV'] || 'production'

worker_timeout 300

pidfile 'tmp/pids/puma.pid'

on_worker_boot do
  # worker specific setup
  puts 'Worker boot...'
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

on_restart do
	puts 'On restart...'
end

