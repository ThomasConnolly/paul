require 'rails_helper'

RSpec.describe "reserve_slots/index", type: :view do
  before(:each) do
    assign(:reserve_slots, [
      ReserveSlot.create!(
        last_name: "Last Name",
        slot: 2
      ),
      ReserveSlot.create!(
        last_name: "Last Name",
        slot: 2
      )
    ])
  end

  it "renders a list of reserve_slots" do
    render
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
