# typed: true
# frozen_string_literal: true

class MinutesMailer < ApplicationMailer
  def new_minutes_email(vestry_minute, recipient)
    @vestry_minute = vestry_minute
    @url = url_for(@vestry_minute)

    mail(
      to: recipient['email'],
      subject: 'Meeting minutes draft posted for you.',
      body: "Hello #{recipient['name']},\n\nPlease review the new meeting minutes draft at #{@url}.\n\nBest regards,\nCharlene"
    )
  end

  def self.send_minutes_emails(vestry_minute)
    email_list = load_email_list
    email_list.each do |recipient|
      MinutesMailer.new_minutes_email(vestry_minute, recipient).deliver_now
    end
  end

  def self.load_email_list
    YAML.load_file(Rails.root.join('config', 'vestry_members.yml'))['email_list']
  end
end
