# Capistranoのバージョンを指定（初期から記入済み）
lock '3.18.0'

# DB設定
set :db_username, ENV['DB_USERNAME']
set :db_password, ENV['DB_PASSWORD']

# アプリケーションの指定
set :application, 'thailand_hp_app'
set :repo_url,  'git@github.com:sakata007/thailand_hp_app.git'

# ブランチをmainブランチに変更
set :branch, "main"

set :deploy_to, '/var/www/thailand_hp_app'

# sharedディレクトリに入れるファイルを指定
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"
set :linked_files, %w(config/master.key)
append :linked_files, '.env'

# SSH接続設定
set :ssh_options, {
  auth_methods: ['publickey'], 
  keys: ['~/.ssh/id_rsa_hannah'] 
}

# 保存しておく世代の設定
set :keep_releases, 5

# rbenvの設定
set :rbenv_type, :user
set :rbenv_ruby, '3.3.0'

# ここからUnicornの設定
# Unicornのプロセスの指定
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの指定
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }

# Unicornを再起動するための記述
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
                  # データベース作成のsqlセット
                # データベース名はdatabase.ymlに設定した名前で
                  sql = "CREATE DATABASE IF NOT EXISTS hannah_production;"
                  # クエリの実行。
                # userとpasswordはmysqlの設定に合わせて
                execute "mysql --user=ENV['DB_USERNAME'] --password=ENV['DB_PASSWORD'] -e '#{sql}'"
        end
      end
    end
  end
end