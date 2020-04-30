require 'rails_helper'

RSpec.describe "albergue_children/index", type: :view do
  before(:each) do
    assign(:albergue_children, [
      AlbergueChild.create!(
        first_name: "First Name",
        last_name: "Last Name",
        user: nil,
        avatar: "Avatar"
      ),
      AlbergueChild.create!(
        first_name: "First Name",
        last_name: "Last Name",
        user: nil,
        avatar: "Avatar"
      )
    ])
  end

  it "renders a list of albergue_children" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Avatar".to_s, count: 2
  end
end
