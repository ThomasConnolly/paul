#!/bin/bash

# Start puma directly
PORT=3000 bundle exec puma -C config/puma.rb &
PUMA_PID=$!

# Start delayed job
bundle exec bin/delayed_job run &
DELAYED_JOB_PID=$!

# Run environment script
ruby print_env.rb &
ENV_PID=$!

# Handle shutdown gracefully
function cleanup {
  echo "Shutting down processes..."
  kill $PUMA_PID $DELAYED_JOB_PID $ENV_PID
  wait
}

trap cleanup SIGINT SIGTERM

echo "Development server started. Press Ctrl+C to stop."
wait