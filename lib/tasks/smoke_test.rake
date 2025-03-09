# Save as lib/tasks/smoke_test.rake
namespace :test do
    desc "Run smoke tests on major routes"
    task smoke: :environment do
        require 'open-uri'
        
        # Add your most important routes here
        routes = [
            '/',
            '/activities/index',
            '/vestry_minutes',
            # Add more routes as needed
        ]
        
        puts "Starting smoke tests on #{Rails.env} environment..."
        
        # Start the server in a separate process
        pid = spawn("rails s -p 3000 -d")
        sleep 5  # Give the server time to start
        
        begin
            routes.each do |route|
                url = "http://localhost:3000#{route}"
                puts "Testing: #{url}"
                
                begin
                    response = URI.open(url)
                    if response.status.first.to_i >= 200 && response.status.first.to_i < 300
                        puts "✅ #{route} - OK"
                    else
                        puts "❌ #{route} - Failed with status: #{response.status.join(' ')}"
                    end
                rescue => e
                    puts "❌ #{route} - Exception: #{e.message}"
                end
            end
        ensure
            # Kill the server
            Process.kill('TERM', pid)
            Process.wait(pid)
        end
        
        puts "Smoke tests completed."
    end
end