# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'links/edit', type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
                            event: 'MyString',
                            time: 'MyString',
                            url: 'MyString'
                          ))
  end

  it 'renders the edit link form' do
    render

    assert_select 'form[action=?][method=?]', link_path(@link), 'post' do
      assert_select 'input[name=?]', 'link[event]'

      assert_select 'input[name=?]', 'link[time]'

      assert_select 'input[name=?]', 'link[url]'
    end
  end
end
