require 'rails_helper'

RSpec.feature 'Deleting exercise' do
     before do
        @user = User.create!(email: 'user@example.com', password: 'password')
        
        @user_exercise = @user.exercises.create(duration_in_min: 45,
                                                workout: "My Body building workout",
                                                workout_date: Date.today)
        login_as(@user)                                                
    end
    
    scenario do 
        visit '/'
        
        click_link 'My Lounge'
        
        path = "/users/#{@user.id}/exercises/#{@user_exercise.id}"
        link = "//a[contains(@href=,\'#{path}\') and .//text()='Destroy']"
        find(:path, link).click
        
        expect(page).to have_content("Exercise has been deleted")
    end
end