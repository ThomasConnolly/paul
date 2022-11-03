require 'rails_helper'

RSpec.describe 'story_assignments/new', type: :view do
  before(:each) do
    assign(:story_assignment, StoryAssignment.new(
                                story_idea: nil,
                                assigned_to: 1,
                                status: 1
                              ))
  end

  it 'renders new story_assignment form' do
    render

    assert_select 'form[action=?][method=?]', story_assignments_path, 'post' do
      assert_select 'input[name=?]', 'story_assignment[story_idea_id]'

      assert_select 'input[name=?]', 'story_assignment[assigned_to]'

      assert_select 'input[name=?]', 'story_assignment[status]'
    end
  end
end
