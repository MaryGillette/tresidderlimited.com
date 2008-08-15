if ENV['production']
  set :application, "example.com"
  set :domain, application
  set :mongrel_servers, 1
  set :mongrel_port, 8000
  set :rails_env, 'production'
else
  set :application, "example.com"
  set :domain, application
  set :mongrel_servers, 3
  set :mongrel_port, 8010
  set :rails_env, 'staging'
end

default_run_options[:pty] = true
set :user, 'din'
set :repository, "git@github.com:user/project.git"
set :scm, 'git'
set :branch, "master"

set :deploy_to, "/path/to/#{application}"
set :deploy_via, :remote_cache

role :app, domain
role :web, domain
role :db,  domain, :primary => true

ssh_options[:username] = '*nix user'
set :runner, '*nix user'



