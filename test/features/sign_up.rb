#Feature: Sign up
#As visitor I want to sign up
#To get access to protected pages

feature 'Sign up' do

  # Scenario: Visitor Signs Up With Valid Data
  #   Given I am a visitor
  #   When I sign up with valid data
  #   Then I should see a successful sign up message
  scenario 'User Signs Up With Valid Data' do
    visit new_user_registration_path
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'changeme'
    fill_in 'Password confirmation', :with => 'changeme'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

end
