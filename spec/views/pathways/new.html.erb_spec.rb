require 'rails_helper'

RSpec.describe "pathways/new", type: :view do
  before(:each) do
    assign(:pathway, Pathway.new(
      image: "MyString",
      title: "MyString",
      link: "MyString"
    ))
  end

  it "renders new pathway form" do
    render

    assert_select "form[action=?][method=?]", pathways_path, "post" do

      assert_select "input[name=?]", "pathway[image]"

      assert_select "input[name=?]", "pathway[title]"

      assert_select "input[name=?]", "pathway[link]"
    end
  end
end
