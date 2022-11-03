require 'rails_helper'

RSpec.describe 'submit_stories/new', type: :view do
  before(:each) do
    assign(:submit_story, SubmitStory.new(
                            title: 'MyString',
                            user: nil,
                            status: 1
                          ))
  end

  it 'renders new submit_story form' do
    render

    assert_select 'form[action=?][method=?]', submit_stories_path, 'post' do
      assert_select 'input[name=?]', 'submit_story[title]'

      assert_select 'input[name=?]', 'submit_story[user_id]'

      assert_select 'input[name=?]', 'submit_story[status]'
    end
  end
end
