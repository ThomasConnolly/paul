require 'rails_helper'

RSpec.describe "pledgers/new", type: :view do
  before(:each) do
    assign(:pledger, Pledger.new(
      :last_name => "MyString",
      :salutation => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :postal_code => "MyString",
      :type => 1,
      :northern_city => "MyString"
    ))
  end

  it "renders new pledger form" do
    render

    assert_select "form[action=?][method=?]", pledgers_path, "post" do

      assert_select "input[name=?]", "pledger[last_name]"

      assert_select "input[name=?]", "pledger[salutation]"

      assert_select "input[name=?]", "pledger[address1]"

      assert_select "input[name=?]", "pledger[address2]"

      assert_select "input[name=?]", "pledger[city]"

      assert_select "input[name=?]", "pledger[state]"

      assert_select "input[name=?]", "pledger[postal_code]"

      assert_select "input[name=?]", "pledger[type]"

      assert_select "input[name=?]", "pledger[northern_city]"
    end
  end
end
