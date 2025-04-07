# Skip connecting to the database during asset precompilation
if defined?(Rake) && (Rake.respond_to?(:application) || Rake.const_defined?(:Task))
  if Rake.respond_to?(:application) && Rake.application.respond_to?(:top_level_tasks) && 
     Rake.application.top_level_tasks.include?('assets:precompile')
    Rake::Task.task_defined?("assets:environment") && 
    Rake::Task["assets:environment"].reenable
  end
end