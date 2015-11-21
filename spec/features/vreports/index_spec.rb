require "rails_helper"

RSpec.feature 'Vreports list' do 
  scenario 'authenticated user' do
    visit vreports_path
    within '#content' do
    expect(find("h1")).to have_content("Vestry")
  end
  end
end