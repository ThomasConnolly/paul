# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'links/index', type: :view do
  before(:each) do
    assign(:links, [
             Link.create!(
               event: 'Event',
               time: 'Time',
               url: 'Url'
             ),
             Link.create!(
               event: 'Event',
               time: 'Time',
               url: 'Url'
             )
           ])
  end

  it 'renders a list of links' do
    render
    assert_select 'tr>td', text: 'Event'.to_s, count: 2
    assert_select 'tr>td', text: 'Time'.to_s, count: 2
    assert_select 'tr>td', text: 'Url'.to_s, count: 2
  end
end
