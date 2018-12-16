require 'rails_helper'

RSpec.describe "donations/index", type: :view do
  before(:each) do
    assign(:donations, [
      Donation.create!(
        :type => "Type",
        :amount => 2,
        :pay_this => 3,
        :user => nil,
        :anonymous => false
      ),
      Donation.create!(
        :type => "Type",
        :amount => 2,
        :pay_this => 3,
        :user => nil,
        :anonymous => false
      )
    ])
  end

  it "renders a list of donations" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
