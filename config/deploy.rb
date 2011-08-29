require 'bundler/capistrano'
set :user, 'root'
set :application, "reachmygoals.org"
set :applicationdir, "application"

set :application, "goals"
set :repository,  "git@github.com:Polymatheus/first_app.git"

set :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "reachmygoals.org"                          # Your HTTP server, Apache/etc
role :app, "reachmygoals.org"                          # This may be the same as your `Web` server
role :db,  "reachmygoals.org", :primary => true # This is where Rails migrations will run

set :user, 'deploy'
set :use_sudo, false
set :deploy_to, "/srv/www/#{application}"
set :deploy_via, :remote_cache 



# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end