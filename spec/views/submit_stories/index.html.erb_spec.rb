require 'rails_helper'

RSpec.describe 'submit_stories/index', type: :view do
  before(:each) do
    assign(:submit_stories, [
             SubmitStory.create!(
               title: 'Title',
               user: nil,
               status: 2
             ),
             SubmitStory.create!(
               title: 'Title',
               user: nil,
               status: 2
             )
           ])
  end

  it 'renders a list of submit_stories' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
