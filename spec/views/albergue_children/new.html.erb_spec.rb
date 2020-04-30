require 'rails_helper'

RSpec.describe "albergue_children/new", type: :view do
  before(:each) do
    assign(:albergue_child, AlbergueChild.new(
      first_name: "MyString",
      last_name: "MyString",
      user: nil,
      avatar: "MyString"
    ))
  end

  it "renders new albergue_child form" do
    render

    assert_select "form[action=?][method=?]", albergue_children_path, "post" do

      assert_select "input[name=?]", "albergue_child[first_name]"

      assert_select "input[name=?]", "albergue_child[last_name]"

      assert_select "input[name=?]", "albergue_child[user_id]"

      assert_select "input[name=?]", "albergue_child[avatar]"
    end
  end
end
