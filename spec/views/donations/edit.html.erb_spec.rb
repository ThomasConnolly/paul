require 'rails_helper'

RSpec.describe "donations/edit", type: :view do
  before(:each) do
    @donation = assign(:donation, Donation.create!(
      :type => "",
      :amount => 1,
      :pay_this => 1,
      :user => nil,
      :anonymous => false
    ))
  end

  it "renders the edit donation form" do
    render

    assert_select "form[action=?][method=?]", donation_path(@donation), "post" do

      assert_select "input[name=?]", "donation[type]"

      assert_select "input[name=?]", "donation[amount]"

      assert_select "input[name=?]", "donation[pay_this]"

      assert_select "input[name=?]", "donation[user_id]"

      assert_select "input[name=?]", "donation[anonymous]"
    end
  end
end
