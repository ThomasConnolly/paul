# frozen_string_literal: true

require 'test_helper'

class ChatChannelTest < ActionCable::Channel::TestCase
  def setup
    @user = users(:one) # replace with your user fixture
    stub_connection current_user: @user
  end

  test 'subscribes to a room' do
    subscribe room: 'room1'
    assert subscription.confirmed?
    assert_has_stream 'chat_room1'
  end

  test 'speak broadcasts a message' do
    subscribe room: 'room1'
    assert subscription.confirmed?

    assert_broadcast_on('chat_room1', message: 'Hello, Rails!') do
      perform :speak, message: 'Hello, Rails!'
    end
  end
end
