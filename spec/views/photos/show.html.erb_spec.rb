# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'photos/show', type: :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
                              title: 'Title',
                              image_data: 'MyText'
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
