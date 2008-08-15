
if ENV['staging']
  set :application, "stage.professionalconsultinggroupinc.com"
  set :domain, "stage.professionalconsultinggroupinc.com"
  set :mongrel_servers, 1
  set :mongrel_port, 8030
  set :rails_env, 'staging'
else
  set :application, "professionalconsultinggroupinc.com"
  set :domain, application
  set :mongrel_servers, 3
  set :mongrel_port, 8020
  set :rails_env, 'production'
end

default_run_options[:pty] = true
set :user, 'din'
set :repository, "git@github.com:pcgi/pcgi.git"
set :scm, 'git'
set :branch, "master"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/web/sites/pcgi.com/#{application}"
set :deploy_via, :remote_cache

role :app, domain
role :web, domain
role :db,  domain, :primary => true

ssh_options[:username] = 'din'
set :runner, 'din'



namespace :deploy do
  namespace :web do
    desc "Serve up a custom maintenance page."
    
    task :disable, :roles => :web do
      require 'erb'
      on_rollback { run "rm #{shared_path}/system/maintenance.html" }
      reason = ENV['REASON']
      deadline = ENV['UNTIL']

      template = File.read("app/views/layouts/maintenance.html.erb")

      page = ERB.new(template).result(binding)
      
      put page, "#{shared_path}/system/maintenance.html", :mode => "0644"
    end
  end
end 
