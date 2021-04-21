require 'rails_helper'

RSpec.describe "shots/index", type: :view do
  before(:each) do
    assign(:shots, [
      Shot.create!(
        last_name: "Last Name",
        first_name: "First Name",
        email: "Email",
        phone: "Phone",
        time: "Time",
        status: "Status",
        honey: "Honey"
      ),
      Shot.create!(
        last_name: "Last Name",
        first_name: "First Name",
        email: "Email",
        phone: "Phone",
        time: "Time",
        status: "Status",
        honey: "Honey"
      )
    ])
  end

  it "renders a list of shots" do
    render
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Phone".to_s, count: 2
    assert_select "tr>td", text: "Time".to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
    assert_select "tr>td", text: "Honey".to_s, count: 2
  end
end
