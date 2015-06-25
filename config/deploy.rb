require 'dotenv'
Dotenv.load

# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'gwsecurity'
set :repo_url, ENV['CAP3_DEPLOY_REPO_URL']
set :deploy_user, ENV['CAP3_DEPLOY_USER']
set :deploy_production_server, ENV['CAP3_DEPLOY_PRODUCTION_SERVER']

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, ENV['CAP3_DEPLOY_TO_PATH'] + "/#{fetch(:application)}/#{fetch(:stage)}"

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('.env', 'config/database.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 3

# for capistrano-unicorn-nginx
# ============================
# https://github.com/bruno-/capistrano-unicorn-nginx
set :unicorn_workers, 2
set :unicorn_service, "unicorn_#{fetch(:application)}_#{fetch(:stage)}"

namespace :deploy do

  # desc "Creates the config/database.yml configuration file in shared path."
  task :copy_config_from_example do
    on release_roles :all do
      unless test("[ -s #{shared_path.join('.env')} ]")
        execute :cp, release_path.join('env.example'), shared_path.join('.env')
      end

      unless test("[ -s #{shared_path.join('config/database.yml')} ]")
        execute :cp, release_path.join('config/database.yml.example'), shared_path.join('config/database.yml')
      end
    end
  end
  before "deploy:assets:precompile", :copy_config_from_example

  task :check_env do

  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
