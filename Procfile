web: bundle exec puma -C config/puma.rb
worker: bundle exec solid_queue:start
release: bundle exec rake db:migrate
