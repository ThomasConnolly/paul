if ENV['MAINTENANCE_MODE'] == 'true'
  # Find the latest maintenance file
  maintenance_file = Dir.glob(Rails.root.join('public', 'maintenance_*.html')).max_by {|f| File.mtime(f) }
  maintenance_file ||= Rails.root.join('public', 'maintenance.html')
  
  # Get just the filename without the path
  filename = File.basename(maintenance_file)
  
  Rails.application.config.middleware.use(
    Rack::Static,
    urls: ["/#{filename}"],
    root: Rails.root.join('public')
  )
  
  Rails.application.config.middleware.insert_before(
    Rails::Rack::Logger,
    Rack::Builder.new do
      map '/' do
        run lambda { |_env|
          [503, { 
            'Content-Type' => 'text/html',
            'Cache-Control' => 'no-store, no-cache, must-revalidate, max-age=0'
          }, [File.read(maintenance_file)]]
        }
      end
    end
  )
end