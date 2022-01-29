# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'shots/show', type: :view do
  before(:each) do
    @shot = assign(:shot, Shot.create!(
                            last_name: 'Last Name',
                            first_name: 'First Name',
                            email: 'Email',
                            phone: 'Phone',
                            time: 'Time',
                            status: 'Status',
                            honey: 'Honey'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Time/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Honey/)
  end
end
