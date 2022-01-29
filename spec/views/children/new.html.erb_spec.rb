# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'children/new', type: :view do
  before(:each) do
    assign(:child, Child.new(
                     first_name: 'MyString',
                     last_name: 'MyString'
                   ))
  end

  it 'renders new child form' do
    render

    assert_select 'form[action=?][method=?]', children_path, 'post' do
      assert_select 'input[name=?]', 'child[first_name]'

      assert_select 'input[name=?]', 'child[last_name]'
    end
  end
end
