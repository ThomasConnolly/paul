require 'rails_helper'

RSpec.describe 'submit_stories/edit', type: :view do
  before(:each) do
    @submit_story = assign(:submit_story, SubmitStory.create!(
                                            title: 'MyString',
                                            user: nil,
                                            status: 1
                                          ))
  end

  it 'renders the edit submit_story form' do
    render

    assert_select 'form[action=?][method=?]', submit_story_path(@submit_story), 'post' do
      assert_select 'input[name=?]', 'submit_story[title]'

      assert_select 'input[name=?]', 'submit_story[user_id]'

      assert_select 'input[name=?]', 'submit_story[status]'
    end
  end
end
