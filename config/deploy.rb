set :application, "tresidderlimited.com"            # Can be whatever you want, I use the project name from my SVN repository
set :domain, "278tre.cyril.hostingrails.com"                # The URL for your app
set :user, "tresidd"                  # Your HostingRails username

default_run_options[:pty] = true
set :repository, "git@github.com:MaryGillette/tresidderlimited.com.git"  # The repository location for git
set :scm, :git
# set :scm_passphrase, "zx1x08"
set :branch, "master"

set :use_sudo, false                	# HostingRails users don't have sudo access
set :deploy_to, "/home/#{user}/#{application}"          # Where on the server your app will be deployed

set :deploy_via, :checkout                # For this tutorial, svn checkout will be the deployment method

set :chmod755, "app config db lib public vendor script script/* public/disp*"  	# Some files that will need proper permissions
# set :mongrel_port, "4444"                # Mongrel port that was assigned to you
# set :mongrel_nodes, "4"                # Number of Mongrel instances for those with multiple Mongrels


# Cap won't work on windows without the above line, see
# http://groups.google.com/group/capistrano/browse_thread/thread/13b029f75b61c09d
# Its OK to leave it true for Linux/Mac

# ssh_options[:keys] = %w(/home/zxonexc/.ssh/authorized_keys2)            # If you are using ssh_keys

role :app, domain
role :web, domain
role :db,  domain, :primary => true
