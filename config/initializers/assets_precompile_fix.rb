# Skip connecting to the database during asset precompilation
if Rake::Task.task_defined?("assets:precompile")
    Rake::Task["assets:precompile"].enhance do
      # Use the correct task name
      if Rake::Task.task_defined?("assets:environment")
        Rake::Task["assets:environment"].reenable
      end
    end
  end