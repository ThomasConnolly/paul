# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'albergue_children/edit', type: :view do
  before(:each) do
    @albergue_child = assign(:albergue_child, AlbergueChild.create!(
                                                first_name: 'MyString',
                                                last_name: 'MyString',
                                                user: nil,
                                                avatar: 'MyString'
                                              ))
  end

  it 'renders the edit albergue_child form' do
    render

    assert_select 'form[action=?][method=?]', albergue_child_path(@albergue_child), 'post' do
      assert_select 'input[name=?]', 'albergue_child[first_name]'

      assert_select 'input[name=?]', 'albergue_child[last_name]'

      assert_select 'input[name=?]', 'albergue_child[user_id]'

      assert_select 'input[name=?]', 'albergue_child[avatar]'
    end
  end
end
