require 'rails_helper'

RSpec.feature "Signup the user" do
    scenario 'with valid credentials' do
        visit '/'
        click_link 'Signup'
        fill_in "Email", "user@example.com"
        fill_in "Password", "password"
        fill_in "Password Confirmation", "password"
        click_button "Signup"
        
        expect(page).to have_conent("You have signed up successfully.")
    end
end