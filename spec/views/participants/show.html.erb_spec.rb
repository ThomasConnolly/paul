# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'participants/show', type: :view do
  before(:each) do
    @participant = assign(:participant, Participant.create!(
                                          references: '',
                                          session: 'Session'
                                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Session/)
  end
end
