require 'rails_helper'


RSpec.feature "member registers for site" do

  scenario "member registers" do
    visit root_path
    click_link "Member sign in"
    fill_in_sign_in_fields
    expect(page).to have_content("Signed in successfully")
  end
end
