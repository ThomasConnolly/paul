# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pray_fors/edit', type: :view do
  before(:each) do
    @pray_for = assign(:pray_for, PrayFor.create!(
                                    first_name: 'MyString',
                                    reason: 'MyString'
                                  ))
  end

  it 'renders the edit pray_for form' do
    render

    assert_select 'form[action=?][method=?]', pray_for_path(@pray_for), 'post' do
      assert_select 'input[name=?]', 'pray_for[first_name]'

      assert_select 'input[name=?]', 'pray_for[reason]'
    end
  end
end
