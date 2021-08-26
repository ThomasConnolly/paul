require 'rails_helper'

RSpec.describe "participants/index", type: :view do
  before(:each) do
    assign(:participants, [
      Participant.create!(
        references: "",
        session: "Session"
      ),
      Participant.create!(
        references: "",
        session: "Session"
      )
    ])
  end

  it "renders a list of participants" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "Session".to_s, count: 2
  end
end
