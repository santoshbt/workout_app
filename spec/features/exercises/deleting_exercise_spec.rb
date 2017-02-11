require 'rails_helper'

RSpec.feature 'Deleting exercise' do
     before do
        @user = User.create!(first_name: "John", last_name: "Doe", email: 'user@example.com', password: 'password')
        
        @user_exercise = @user.exercises.create(duration_in_min: 45,
                                                workout: "My Body building workout",
                                                workout_date: Date.today)
        login_as(@user)                                                
    end
    
    scenario do 
        visit '/'
        
        click_link 'My Lounge'
        
        # path = "/users/#{@user.id}/exercises/#{@user_exercise.id}"
        # link = "//a[contains(@href=,\'#{path}\') and .//text()='Destroy']"
        
        link = "//a[contains(@href,
 	         '/users/#{@user.id}/exercises/#{@user_exercise.id}')
              and .//text()='Destroy']"
              
        find(:xpath, link).click
        
        
        expect(page).to have_content("Exercise has been deleted.")
    end
end