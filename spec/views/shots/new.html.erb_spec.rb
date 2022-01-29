# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'shots/new', type: :view do
  before(:each) do
    assign(:shot, Shot.new(
                    last_name: 'MyString',
                    first_name: 'MyString',
                    email: 'MyString',
                    phone: 'MyString',
                    time: 'MyString',
                    status: 'MyString',
                    honey: 'MyString'
                  ))
  end

  it 'renders new shot form' do
    render

    assert_select 'form[action=?][method=?]', shots_path, 'post' do
      assert_select 'input[name=?]', 'shot[last_name]'

      assert_select 'input[name=?]', 'shot[first_name]'

      assert_select 'input[name=?]', 'shot[email]'

      assert_select 'input[name=?]', 'shot[phone]'

      assert_select 'input[name=?]', 'shot[time]'

      assert_select 'input[name=?]', 'shot[status]'

      assert_select 'input[name=?]', 'shot[honey]'
    end
  end
end
