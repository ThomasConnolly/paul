# typed: false
# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}",
                                        role: 'alert') do
               concat(content_tag(:button, 'x', class: 'close',
                                                data: { dismiss: 'alert' }))
               concat(message)
             end)
    end
    nil
  end

  def formatted_amount(amount)
    number_to_currency(amount / 100.0)
  end
end
