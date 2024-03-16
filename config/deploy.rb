# config valid for current version and patch releases of Capistrano
lock "3.18.0"

# アプリ名
set :application, "thailand_hp_app"

# GitHubリポジトリ情報
set :repo_url, "git@github.com:sakata007/thailand_hp_app.git"

# ユーザーはdeployにする
set :user, "deploy"

# rbenvをユーザーレベルでインストール
set :rbenv_type, :user

# rubyのバージョンを指定
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"

# 並列数
set :bundle_jobs, 2

# リリース間で共有するリソースのファイルパスを書く
append :linked_files, "config/master.key"

set :pty, true

# 各リリースが共通で読み込むディレクトリを設定する
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets",  '.bundle'

# branchをmainブランチに設定
set :branch, 'main'

# tailwind対策のため追記
after 'deploy:updated', 'deploy:compile_assets'

# RACK_ENVに関する設定を追記
namespace :deploy do
  desc 'Set environment variables'
  task :set_environment_variables do
    on roles(:app) do
      execute :echo, "'export RACK_ENV=production' >> ~/.bashrc"
      # 他の環境変数も同様に設定
    end
  end
end

before 'deploy:starting', 'deploy:set_environment_variables'