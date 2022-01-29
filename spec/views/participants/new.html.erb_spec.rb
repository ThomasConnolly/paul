# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'participants/new', type: :view do
  before(:each) do
    assign(:participant, Participant.new(
                           references: '',
                           session: 'MyString'
                         ))
  end

  it 'renders new participant form' do
    render

    assert_select 'form[action=?][method=?]', participants_path, 'post' do
      assert_select 'input[name=?]', 'participant[references]'

      assert_select 'input[name=?]', 'participant[session]'
    end
  end
end
