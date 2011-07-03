require 'bundler/capistrano'
set :user, 'root'
set :domain, 'reachmygoals.org'
set :applicationdir, "application"

set :application, "goals"
set :repository,  "ssh://root@178.79.177.231/~/goals.git"

set :scm, 'git'
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "domain"                          # Your HTTP server, Apache/etc
role :app, "domain"                          # This may be the same as your `Web` server
role :db,  "domain", :primary => true # This is where Rails migrations will run


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end