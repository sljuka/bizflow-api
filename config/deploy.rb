# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'bizflow-api'
set :repo_url, 'git@github.com:sljuka/bizflow-api.git'
set :rbenv_ruby, '2.2.2'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deploy/apps/bizflow-api'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'bizflow_db')

set :bundle_bins, fetch(:bundle_bins, []).push('bizflow')
set :bundle_binstubs, -> { current_path.join('bin') }

set :whenever_environment, defer { stage }
set :whenever_command, 'bundle exec whenever'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :default_env, {
  path: "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

# set :default_environment, {
#     'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
# }

namespace :rbenv do
  task :rehash do
    on roles(:web, :app, :db) do
      execute :rbenv, 'rehash'
    end
  end
end

# Default value for keep_releases is 5
# set :keep_releases, 5
namespace :deploy do
  
  desc 'Restart application'
  task :restart do
    on roles(:app) do
      execute "cd #{current_path} && bundle exec bizflow migrate production"
      execute "cd #{current_path} && bundle exec bizflow build production"
      execute :mkdir, '-p', current_path.join('tmp')
      execute :touch, current_path.join('tmp/restart.txt')
    end
  end

end

after "deploy:publishing", "rbenv:rehash"
after "deploy:updated", "deploy:migrate"
after "deploy:published", "deploy:restart"
