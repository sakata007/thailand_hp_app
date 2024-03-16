require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"
require 'capistrano/rails'
require "capistrano/rbenv"

install_plugin Capistrano::SCM::Git

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }