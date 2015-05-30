set :stage,     :staging
set :rails_env, 'staging'
set :branch,    'master'

set :deploy_user, 'mais'
set :server_name, 'staging.shakmog.com'

set :full_app_name, "#{fetch(:application)}-#{fetch(:rails_env)}"

set :deploy_to, "/home/mais/applications/#{fetch(:application)}/#{fetch(:rails_env)}"

role :app, %w{76.74.249.147}
role :web, %w{76.74.249.147}
role :db,  %w{76.74.249.147}

server '76.74.249.147', user: fetch(:deploy_user), roles: %w{web app db}, primary: true

# number of unicorn workers, this will be reflected in
# the unicorn.rb and the monit configs
set :unicorn_worker_count, 5

# whether we're using ssl or not, used for building nginx
# config file
set :enable_ssl, false
