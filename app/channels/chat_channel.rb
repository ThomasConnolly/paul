# typed: true
# frozen_string_literal: true

class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room]}"
  end

  def speak(data)
    Rails.logger.debug data
    ActionCable.server.broadcast("chat_#{params[:room]}", message: data['message'])
  end
end
