require 'rails_helper'

RSpec.describe "reserve_slots/edit", type: :view do
  before(:each) do
    @reserve_slot = assign(:reserve_slot, ReserveSlot.create!(
      last_name: "MyString",
      slot: 1
    ))
  end

  it "renders the edit reserve_slot form" do
    render

    assert_select "form[action=?][method=?]", reserve_slot_path(@reserve_slot), "post" do

      assert_select "input[name=?]", "reserve_slot[last_name]"

      assert_select "input[name=?]", "reserve_slot[slot]"
    end
  end
end
