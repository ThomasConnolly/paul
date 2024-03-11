# frozen_string_literal: true

namespace :cleanup do
  desc 'Destroy unconfirmed users'
  task unconfirmed_users: :environment do
    User.where(confirmed_at: nil).destroy_all
  end
end
