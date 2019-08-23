# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pledgers/index', type: :view do
  before(:each) do
    assign(:pledgers, [
             Pledger.create!(
               last_name: 'Last Name',
               salutation: 'Salutation',
               address1: 'Address1',
               address2: 'Address2',
               city: 'City',
               state: 'State',
               postal_code: 'Postal Code',
               type: 2,
               northern_city: 'Northern City'
             ),
             Pledger.create!(
               last_name: 'Last Name',
               salutation: 'Salutation',
               address1: 'Address1',
               address2: 'Address2',
               city: 'City',
               state: 'State',
               postal_code: 'Postal Code',
               type: 2,
               northern_city: 'Northern City'
             )
           ])
  end

  it 'renders a list of pledgers' do
    render
    assert_select 'tr>td', text: 'Last Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Salutation'.to_s, count: 2
    assert_select 'tr>td', text: 'Address1'.to_s, count: 2
    assert_select 'tr>td', text: 'Address2'.to_s, count: 2
    assert_select 'tr>td', text: 'City'.to_s, count: 2
    assert_select 'tr>td', text: 'State'.to_s, count: 2
    assert_select 'tr>td', text: 'Postal Code'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 'Northern City'.to_s, count: 2
  end
end
