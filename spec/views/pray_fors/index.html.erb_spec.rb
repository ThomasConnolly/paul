require 'rails_helper'

RSpec.describe "pray_fors/index", type: :view do
  before(:each) do
    assign(:pray_fors, [
      PrayFor.create!(
        first_name: "First Name",
        reason: "Reason"
      ),
      PrayFor.create!(
        first_name: "First Name",
        reason: "Reason"
      )
    ])
  end

  it "renders a list of pray_fors" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Reason".to_s, count: 2
  end
end
