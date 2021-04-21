require 'rails_helper'

RSpec.describe "shots/edit", type: :view do
  before(:each) do
    @shot = assign(:shot, Shot.create!(
      last_name: "MyString",
      first_name: "MyString",
      email: "MyString",
      phone: "MyString",
      time: "MyString",
      status: "MyString",
      honey: "MyString"
    ))
  end

  it "renders the edit shot form" do
    render

    assert_select "form[action=?][method=?]", shot_path(@shot), "post" do

      assert_select "input[name=?]", "shot[last_name]"

      assert_select "input[name=?]", "shot[first_name]"

      assert_select "input[name=?]", "shot[email]"

      assert_select "input[name=?]", "shot[phone]"

      assert_select "input[name=?]", "shot[time]"

      assert_select "input[name=?]", "shot[status]"

      assert_select "input[name=?]", "shot[honey]"
    end
  end
end
