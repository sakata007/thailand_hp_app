# app_dir = File.expand_path("../..", __FILE__)
# bind "unix://#{app_dir}/tmp/sockets/puma.sock"
# pidfile "#{app_dir}/tmp/pids/puma.pid"
# state_path "#{app_dir}/tmp/pids/puma.state"
# stdout_redirect "#{app_dir}/log/puma.stdout.log", "#{app_dir}/log/puma.stderr.log", true

bind "unix:///var/www/thailand_hp_app/shared/tmp/sockets/puma.sock;"
# bind "unix://#{Rails.root}/tmp/sockets/puma.sock"
pidfile "#{Rails.root}/tmp/pids/puma.pid"
state_path "#{Rails.root}/tmp/pids/puma.state"
stdout_redirect "#{Rails.root}/log/puma.stdout.log", "#{Rails.root}/log/puma.stderr.log", true