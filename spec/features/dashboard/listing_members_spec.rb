require 'rails_helper'
RSpec.feature 'list all members', focus: true do
    before do
        @john = User.create(first_name: 'Jon',
                            last_name: 'Doe',
                            email: 'john@example.com',
                            password: 'password')
                            
        @sara = User.create(first_name: 'Sara',
                            last_name: 'Jones',
                            email: 'sara@example.com',
                            password: 'password')
                                    
        
    end
    
    scenario 'shows a list of registered members' do
        visit '/'
        
        expect(page).to have_content('List of members')
        expect(page).to have_content(@john.full_name)
        expect(page).to have_content(@sara.full_name)
    end
end