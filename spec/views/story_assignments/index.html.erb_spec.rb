require 'rails_helper'

RSpec.describe "story_assignments/index", type: :view do
  before(:each) do
    assign(:story_assignments, [
      StoryAssignment.create!(
        story_idea: nil,
        assigned_to: 2,
        status: 3
      ),
      StoryAssignment.create!(
        story_idea: nil,
        assigned_to: 2,
        status: 3
      )
    ])
  end

  it "renders a list of story_assignments" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
