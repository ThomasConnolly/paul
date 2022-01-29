# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reserve_slots/new', type: :view do
  before(:each) do
    assign(:reserve_slot, ReserveSlot.new(
                            last_name: 'MyString',
                            slot: 1
                          ))
  end

  it 'renders new reserve_slot form' do
    render

    assert_select 'form[action=?][method=?]', reserve_slots_path, 'post' do
      assert_select 'input[name=?]', 'reserve_slot[last_name]'

      assert_select 'input[name=?]', 'reserve_slot[slot]'
    end
  end
end
