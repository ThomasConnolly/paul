# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_class_for(flash_type)
    { success: 'alert-success', error: 'alert-danger', alert: 'alert-warning', notice: 'alert-info' }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: 'alert') do
               concat content_tag(:button, 'x', class: 'close', data: { dismiss: 'alert' })
               concat message
             end)
    end
    nil
    end

  # This code is for RailsCasts episode on creating surveys
  #   def link_to_remove_fields(name, f)
  #     f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  #   end
  #
  #   def link_to_add_fields(name, f, association)
  #     new_object = f.object.class.reflect_on_association(association).klass.new
  #     fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
  #       render(association.to_s.singularize + "_fields", :f => builder)
  #     end
  #     link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  #   end
end
