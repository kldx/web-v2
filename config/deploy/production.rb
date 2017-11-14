set :application, 'kldxteam_production'
set :stage, :production
set :rails_env, :production
set :deploy_to, '/home/deploy/kldxteam_production'
set :release_note_url, 'http://kldxteam.com/release_note.txt'

server 'kldxteam.com', user: 'deploy', roles: %w{web app db job}
