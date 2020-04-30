require 'rails_helper'

RSpec.describe "albergue_children/show", type: :view do
  before(:each) do
    @albergue_child = assign(:albergue_child, AlbergueChild.create!(
      first_name: "First Name",
      last_name: "Last Name",
      user: nil,
      avatar: "Avatar"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Avatar/)
  end
end
