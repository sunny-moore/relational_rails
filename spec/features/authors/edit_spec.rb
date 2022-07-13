# User Story 12, Parent Update 

# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
require 'rails_helper'

RSpec.describe 'Author edit function' do
  it 'the author show page has an Update Author link to /authors/:id/edit' do
    author = Author.create!(name: 'Susan Collins', awards: 0, deceased: false)

    visit "/authors/#{author.id}"
    click_on('Update Author')
    
    expect(current_path).to eq("/authors/#{author.id}/edit")
  end
  it 'edits the author info and redirects to author show page' do
    author = Author.create!(name: 'Susie', awards: 0, deceased: false)
  
    visit "/authors/#{author.id}"
    click_on('Update Author')

    fill_in('Name', with: 'Susan Collins')
    fill_in('Awards', with: 0)
    fill_in('Deceased', with: false)
    click_button('Submit')
    expect(current_path).to eq("/authors/#{author.id}")
    expect(page).to have_content('Susan Collins')
  end
end