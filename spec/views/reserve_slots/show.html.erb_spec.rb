# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reserve_slots/show', type: :view do
  before(:each) do
    @reserve_slot = assign(:reserve_slot, ReserveSlot.create!(
                                            last_name: 'Last Name',
                                            slot: 2
                                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/2/)
  end
end
