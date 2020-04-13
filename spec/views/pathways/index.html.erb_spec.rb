require 'rails_helper'

RSpec.describe "pathways/index", type: :view do
  before(:each) do
    assign(:pathways, [
      Pathway.create!(
        image: "Image",
        title: "Title",
        link: "Link"
      ),
      Pathway.create!(
        image: "Image",
        title: "Title",
        link: "Link"
      )
    ])
  end

  it "renders a list of pathways" do
    render
    assert_select "tr>td", text: "Image".to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Link".to_s, count: 2
  end
end
