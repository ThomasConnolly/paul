web: bundle exec puma -C config/puma.rb
release: bundle exec rake db:migrate assets:clean assets:precompile
worker: bundle exec bin/delayed_job run
