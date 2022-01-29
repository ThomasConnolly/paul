# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pray_fors/new', type: :view do
  before(:each) do
    assign(:pray_for, PrayFor.new(
                        first_name: 'MyString',
                        reason: 'MyString'
                      ))
  end

  it 'renders new pray_for form' do
    render

    assert_select 'form[action=?][method=?]', pray_fors_path, 'post' do
      assert_select 'input[name=?]', 'pray_for[first_name]'

      assert_select 'input[name=?]', 'pray_for[reason]'
    end
  end
end
