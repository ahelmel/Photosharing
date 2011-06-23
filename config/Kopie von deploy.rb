require 'bundler/capistrano'

set :application, "Photosharing"

set :repository,  "https://github.com/ahelmel/Photosharing.git"
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

server "10.28.19.108", :web, :app, :db, :primary => true

set :user, 'student'
set :use_sudo, true

set :deploy_to, '/home/student/todo'

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

namespace :customs do
  task :symlink, :roles => :app do
    run <<-CMD
      ln -nfs #{shared_path}/images #{release_path}/public/images
    CMD
  end
end
after "deploy:update_code","customs:symlink"