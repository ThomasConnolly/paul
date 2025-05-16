# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

# St. Paul's Church Application

## Common Admin Tasks
- **Change User Roles**: # In Rails console
user = User.find(user_id)
user.update(roles: user.roles - ["admin"])  # Replace "admin" with the role you want to remove
- **Send Test Email**: `UserMailer.welcome_email(User.first).deliver_now`
- **Process Background Jobs**: `Delayed::Job.all.each(&:invoke_job)`
