require 'rails_helper'

RSpec.describe "pledgers/show", type: :view do
  before(:each) do
    @pledger = assign(:pledger, Pledger.create!(
      :last_name => "Last Name",
      :salutation => "Salutation",
      :address1 => "Address1",
      :address2 => "Address2",
      :city => "City",
      :state => "State",
      :postal_code => "Postal Code",
      :type => 2,
      :northern_city => "Northern City"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Salutation/)
    expect(rendered).to match(/Address1/)
    expect(rendered).to match(/Address2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Northern City/)
  end
end
