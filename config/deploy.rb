$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'
require 'bundler/capistrano'

set :application, "my.dss.ucdavis.edu"

set :repository,  "git://github.com/cthielen/dss-messenger.git"
set :scm, :git
set :branch, "master"

role :web, application
role :app, application
role :db,  application, :primary => true

set :user, "deploy"
set :deploy_to, "/var/www/apps/dss-messenger"
set :deploy_via, :remote_cache
set :use_sudo, false

namespace :deploy do
  desc "Tell Passenger to restart the app."
    task :restart do
      run "touch #{current_path}/tmp/restart.txt"
    end

    desc "Symlink shared configs and folders on each release."
    task :symlink_shared do
      run "mkdir -p #{shared_path}/config"
      run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
      run "ln -nfs #{shared_path}/config/api_keys.yml #{release_path}/config/api_keys.yml"
      run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
    end

    desc "Pre-compile the assets."
    task :precompile_assets do #, :roles => :web, :except => { :no_release => true } do
      run "cd #{current_path}; rm -rf public/assets/*"
      run "cd #{current_path}; RAILS_ENV=production bundle exec rake assets:precompile"
    end
end

after 'deploy:update_code', 'deploy:symlink_shared'
after 'deploy:update_code', 'deploy:precompile_assets'

# INSTALLME: Modify this action if you use Capistrano with your own SSH keys
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa-deploy")]
