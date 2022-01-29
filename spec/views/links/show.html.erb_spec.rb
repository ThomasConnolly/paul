# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'links/show', type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
                            event: 'Event',
                            time: 'Time',
                            url: 'Url'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Event/)
    expect(rendered).to match(/Time/)
    expect(rendered).to match(/Url/)
  end
end
