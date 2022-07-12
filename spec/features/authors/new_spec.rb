# User Story 11, Parent Creation 

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

require 'rails_helper'

RSpec.describe 'author/new page' do
  it 'author index page has a link to create new Author, taking you to author/new' do
    visit '/authors'

    expect(page).to have_content('Add New Author')

    click_on('Add New Author')

    expect(current_path).to eq('/authors/new')
  end

  it '/author/new has a form that will create a new Author' do
    visit '/authors/new'
save_and_open_page

    fill_in('Name', with: 'James Collins')
    fill_in('Awards', with: 0)
    fill_in('Deceased', with: true)
    click_button('Add Author')
    expect(current_path).to eq('/authors')
    expect(page).to have_content('James Collins')
  end
end