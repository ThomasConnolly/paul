# Feature: Home Page
# As a visitor, or guest (someone not logged in to the site)
# I want to visit the home Page
  feature 'Home Page' do
  scenario 'Visit the sermons page' do
    visit root_path
    #expect (page).to have_content 'sermons'
  end
end