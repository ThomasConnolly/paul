# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tasks/edit', type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
                            title: 'MyString',
                            description: 'MyString',
                            deadline: 'MyString',
                            position: 1
                          ))
  end

  it 'renders the edit task form' do
    render

    assert_select 'form[action=?][method=?]', task_path(@task), 'post' do
      assert_select 'input[name=?]', 'task[title]'

      assert_select 'input[name=?]', 'task[description]'

      assert_select 'input[name=?]', 'task[deadline]'

      assert_select 'input[name=?]', 'task[position]'
    end
  end
end
