require "rvm/capistrano"
require 'bundler/capistrano'
set :whenever_command, "bundle exec whenever"
require 'whenever/capistrano'

set :application, "devict.org"
set :repository,  "git://github.com/devict/devict.com.git"
set :deploy_to, "/home/upfront/upfrontwichita/"
set :rvm_ruby_string, "2.0.0@upfrontwichita.com"
set :user, "upfront"
set :use_sudo, false

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "devict.org"                          # Your HTTP server, Apache/etc
role :app, "devict.org"                          # This may be the same as your `Web` server
role :db,  "devict.org", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup", "deploy:update_crontab"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :update_crontab, :roles => :db do
    run "cd #{release_path} && whenever --update-crontab #{application}"
  end
end
