require 'rails_helper'

RSpec.describe "children/index", type: :view do
  before(:each) do
    assign(:children, [
      Child.create!(
        first_name: "First Name",
        last_name: "Last Name"
      ),
      Child.create!(
        first_name: "First Name",
        last_name: "Last Name"
      )
    ])
  end

  it "renders a list of children" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
  end
end
