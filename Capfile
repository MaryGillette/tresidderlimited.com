load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy'


class Capistrano::Configuration

  ##
  # Print an informative message with asterisks.

  def inform(message)
    puts "#{'*' * (message.length + 4)}"
    puts "* #{message} *"
    puts "#{'*' * (message.length + 4)}"
  end

  ##
  # Read a file and evaluate it as an ERB template.
  # Path is relative to this file's directory.

  def render_erb_template(filename)
    template = File.read(filename)
    result   = ERB.new(template).result(binding)
  end

  ##
  # Run a command and return the result as a string.
  #
  # TODO May not work properly on multiple servers.

  def run_and_return(cmd)
    output = []
    run cmd do |ch, st, data|
      output << data
    end
    return output.to_s
  end

end


desc "Copy config files"
task :copy_config_files do
  run "cp #{shared_path}/config/* #{release_path}/config/"
end
after "deploy:update_code", "copy_config_files"

desc "Generate spin script from variables"
task :generate_spin_script, :roles => :app do
  result = render_erb_template(File.dirname(__FILE__) + "/config/spin.erb")
  put result, "#{release_path}/script/spin", :mode => 0755
end
after "deploy:update_code", "generate_spin_script"

desc "Fix the permissions on script spin"
task :fix_script_perms do
  run "chmod 755 #{latest_release}/script/spin"
end
after "deploy:update_code", 'fix_script_perms'

desc "Create shared directories and default database.yml."
task :create_shared_config do
  run "mkdir -p #{shared_path}/config"
  run "mkdir -p #{shared_path}/public/stylesheets"

  # Copy database.yml if it doesn't exist.
  result = run_and_return "ls #{shared_path}/config"
  unless result.match(/database\.yml/)
    contents = render_erb_template(File.dirname(__FILE__) + "/templates/database.yml")
    put contents, "#{shared_path}/config/database.yml"
    inform "Please edit database.yml in the shared directory."
  end
end
after "deploy:setup", "create_shared_config"

desc "Make sym link for user content"
task :make_sym_links_for_user_content do
  run "ln -s  #{shared_path}/reports #{release_path}/reports"
  run "ln -s  #{shared_path}/public/attachments #{release_path}/public/attachments"  
end
after "deploy:update_code", "make_sym_links_for_user_content"


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