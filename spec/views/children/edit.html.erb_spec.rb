require 'rails_helper'

RSpec.describe "children/edit", type: :view do
  before(:each) do
    @child = assign(:child, Child.create!(
      first_name: "MyString",
      last_name: "MyString"
    ))
  end

  it "renders the edit child form" do
    render

    assert_select "form[action=?][method=?]", child_path(@child), "post" do

      assert_select "input[name=?]", "child[first_name]"

      assert_select "input[name=?]", "child[last_name]"
    end
  end
end
