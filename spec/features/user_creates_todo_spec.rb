require 'rails_helper'

feature "User creates todo" do
  scenario "Successfully" do
    visit new_todo_path

    click_on "Add"
    fill_in "Title", with: "Buy milk"
    click_on "Submit"

    expect(page).to have_css '.todos li', "Buy milk"

  end
end
