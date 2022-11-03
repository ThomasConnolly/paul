require 'rails_helper'

RSpec.describe 'story_assignments/show', type: :view do
  before(:each) do
    @story_assignment = assign(:story_assignment, StoryAssignment.create!(
                                                    story_idea: nil,
                                                    assigned_to: 2,
                                                    status: 3
                                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
