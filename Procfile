web: bundle exec puma -C config/puma.rb
release: bundle exec rake propshaft:fix_root && bundle exec rake db:migrate
worker: bundle exec bin/delayed_job run