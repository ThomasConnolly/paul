# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pray_fors/show', type: :view do
  before(:each) do
    @pray_for = assign(:pray_for, PrayFor.create!(
                                    first_name: 'First Name',
                                    reason: 'Reason'
                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Reason/)
  end
end
