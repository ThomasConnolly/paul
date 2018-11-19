if Rails.env.development?
  MAX_LOG_SIZE = 4.megabytes
  logs = File.join(Rails.root, 'log', '*.log')
  if Dir[logs].any? { |log| File.size?(log).to_i > MAX_LOG_SIZE }
  'rails log:clear'
  end
end
