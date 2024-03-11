# frozen_string_literal: true

equire 'test_helper'

class ChatChannelTest < ActionCable::Channel::TestCase
  def test_subscribed
    # Simulate a subscription creation
    subscribe

    # Assert the subscription was successfully created
    assert subscription.confirmed?

    # Assert that the channel subscribes connection to a stream
    assert_has_stream "chat_#{params[:room]}"
  end

  def test_speak
    subscribe(room: 'room1')

    # Simulate a speak action on the incoming WebSocket
    perform :speak, message: 'Hello, Rails!'

    # Assert that the message was broadcast to the stream
    assert_broadcast_on('chat_room1', message: 'Hello, Rails!')
  end
end
