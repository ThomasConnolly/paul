require 'rails_helper'

RSpec.describe "story_assignments/edit", type: :view do
  before(:each) do
    @story_assignment = assign(:story_assignment, StoryAssignment.create!(
      story_idea: nil,
      assigned_to: 1,
      status: 1
    ))
  end

  it "renders the edit story_assignment form" do
    render

    assert_select "form[action=?][method=?]", story_assignment_path(@story_assignment), "post" do

      assert_select "input[name=?]", "story_assignment[story_idea_id]"

      assert_select "input[name=?]", "story_assignment[assigned_to]"

      assert_select "input[name=?]", "story_assignment[status]"
    end
  end
end
