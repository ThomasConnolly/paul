require 'rails_helper'

feature "User visits home page" do
  scenario "successfully" do
    visit '/'

    expect(page).to have_css 'h1', text: "Come worship with us!"

  end
end
