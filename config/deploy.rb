lock "3.18.0"

set :application, "thailand_hp_app"
set :repo_url, "git@github.com:sakata007/thailand_hp_app.git"
set :branch, "main"

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :confirm do
    on roles(:app) do
      puts "This stage is '#{fetch(:stage)}'. Deploying branch is '#{fetch(:branch)}'."
      puts 'Are you sure? [y/n]'
      ask :answer, 'n'
      if fetch(:answer) != 'y'
        puts 'deploy stopped'
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      invoke 'deploy'
    end
  end

  before :starting, :confirm
end

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"