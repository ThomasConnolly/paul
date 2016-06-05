require "rspec/core/rake_task"
 
 
RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = ['--color', '--format', 'doc']
end
#rescue LoadError
#end

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks
