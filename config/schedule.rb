# typed: false
# frozen_string_literal: true

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

every 1.day do
  rake 'cleanup:unconfirmed_users'
end

# Learn more: http://github.com/javan/whenever
