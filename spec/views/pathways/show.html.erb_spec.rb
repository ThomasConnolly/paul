require 'rails_helper'

RSpec.describe "pathways/show", type: :view do
  before(:each) do
    @pathway = assign(:pathway, Pathway.create!(
      image: "Image",
      title: "Title",
      link: "Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Link/)
  end
end
