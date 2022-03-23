require 'rails_helper'

RSpec.describe "submit_stories/show", type: :view do
  before(:each) do
    @submit_story = assign(:submit_story, SubmitStory.create!(
      title: "Title",
      user: nil,
      status: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
