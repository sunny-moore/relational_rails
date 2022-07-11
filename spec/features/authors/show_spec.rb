# User Story 2, Parent Show 
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table

require 'rails_helper'

RSpec.describe 'Author show page' do 
  it 'shows the author name and attributes' do
    author = Author.create!(name: 'Stephen King', deceased: false, awards: 10)

    visit "/authors/#{author.id}"

    expect(page).to have_content(author.name)
    expect(page).to have_content(author.deceased)
    expect(page).to have_content(author.awards)
    expect(page).to have_content(author.created_at)
    expect(page).to have_content(author.updated_at)
  end
end