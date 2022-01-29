# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'participants/edit', type: :view do
  before(:each) do
    @participant = assign(:participant, Participant.create!(
                                          references: '',
                                          session: 'MyString'
                                        ))
  end

  it 'renders the edit participant form' do
    render

    assert_select 'form[action=?][method=?]', participant_path(@participant), 'post' do
      assert_select 'input[name=?]', 'participant[references]'

      assert_select 'input[name=?]', 'participant[session]'
    end
  end
end
