# Feature: Pledge Page
# As a member, (someone logged in to the site)
# I want to visit the pledge page
  feature 'Pledge Page' do
  scenario 'Visit the pledges page' do
    visit new_pledge_path
    #expect (page).to have_content 'pledge'
  end
end