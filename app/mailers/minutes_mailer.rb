# typed: true
# frozen_string_literal: true

class MinutesMailer < ApplicationMailer
  def new_minutes_email(vestry_minute_id, recipient)
    # Find the vestry minute by ID instead of receiving the object directly
    @vestry_minute = VestryMinute.find(vestry_minute_id)
    @url = url_for(@vestry_minute)
    @recipient = recipient

    mail(
      to: recipient['email'],
      subject: 'Meeting minutes draft posted for you.'
    )
  end

  def self.send_minutes_emails(vestry_minute)
    # Pass the ID instead of the object
    vestry_minute_id = vestry_minute.is_a?(VestryMinute) ? vestry_minute.id : vestry_minute
    
    email_list = load_email_list
    email_list.each do |recipient|
      MinutesMailer.new_minutes_email(vestry_minute_id, recipient).deliver_later
    end
  end

  def self.load_email_list
    YAML.load_file(Rails.root.join('config/vestry_members.yml'))['email_list']
  end
end
