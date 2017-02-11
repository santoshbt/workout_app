require 'rails_helper'

RSpec.feature 'Editing Exercie' do
    before do
        @user = User.create!(first_name: "John", last_name: "Doe",first_name: "John", last_name: "Doe", email: 'user@example.com', password: 'password')
        
        @user_exercise = @user.exercises.create(duration_in_min: 45,
                                                workout: "My Body building workout",
                                                workout_date: Date.today)
        login_as(@user)                                                
    end
    
    scenario "with valid data succeeds" do 
        visit '/'
        
        click_link 'My Lounge'
        
        path = "/users/#{@user.id}/exercises/#{@user_exercise.id}/edit"
        link = "a[href=\'#{path}\']"
        find(link).click
        
        fill_in "Duration", with: 40
        click_button "Update Exercise"
        
        expect(page).to have_content("Exercise has been updated")
        expect(page).to have_content(40)
        expect(page).not_to have_content(45)
    end
end