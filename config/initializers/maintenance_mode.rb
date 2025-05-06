if ENV['MAINTENANCE_MODE'] == 'true'
  Rails.application.config.middleware.use(
    Rack::Static,
    urls: ["/maintenance.html"],
    root: Rails.root.join('public')
  )
  
  Rails.application.config.middleware.insert_before(
    Rails::Rack::Logger,
    Rack::Builder.new do
      map '/' do
        run lambda { |_env|
          [503, { 'Content-Type' => 'text/html' }, [File.read(Rails.root.join('public', 'maintenance.html'))]]
        }
      end
    end
  )
end