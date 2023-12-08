# frozen_string_literal: true

class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room]}"
  end
end

#   def unsubscribed
#     # Any cleanup needed when channel is unsubscribed
#   end
# end
