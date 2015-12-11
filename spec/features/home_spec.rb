require 'rails_helper'

feature "visiting the homepage" do
  scenario "the visitor sees Saint Paul's" do
    visit root_path
    expect(page).to have_text("All are welcome")
  end
end