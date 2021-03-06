# config valid for current version and patch releases of Capistrano
lock "~> 3.14"

set :group, 'ldpd'
set :application, 'key_resources'
set :repo_url, "git@github.com:cul/ldpd-key-resources.git"
set :remote_user, "#{fetch(:group)}serv"
set :deploy_name, "#{fetch(:application)}_#{fetch(:stage)}"
set :deploy_to, "/opt/passenger/#{fetch(:group)}/#{fetch(:deploy_name)}"
set :rails_env, fetch(:deploy_name)
set :rvm_ruby_version, fetch(:deploy_name)

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/master.key", "config/permissions.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 2

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# Deploy account doesn't directly call passenger
set :passenger_restart_with_touch, true
