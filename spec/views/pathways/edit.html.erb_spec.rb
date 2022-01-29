# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pathways/edit', type: :view do
  before(:each) do
    @pathway = assign(:pathway, Pathway.create!(
                                  image: 'MyString',
                                  title: 'MyString',
                                  link: 'MyString'
                                ))
  end

  it 'renders the edit pathway form' do
    render

    assert_select 'form[action=?][method=?]', pathway_path(@pathway), 'post' do
      assert_select 'input[name=?]', 'pathway[image]'

      assert_select 'input[name=?]', 'pathway[title]'

      assert_select 'input[name=?]', 'pathway[link]'
    end
  end
end
