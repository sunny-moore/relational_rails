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
  it 'shows a count of the authors books (User Story 7)' do
    author = Author.create!(name: 'Stephen King', deceased: false, awards: 10)
    book1 = author.books.create!(name: 'The Stand', length: 1152, in_print: true)
    book2 = author.books.create!(name: 'It', length: 1138, in_print: true)
    book3 = author.books.create!(name: 'Carrie', length: 199, in_print: false)

    visit "/authors/#{author.id}"

    expect(page).to have_content("Books Written: 3")
  end
  it 'author show page has link to authors books(User Story 10)' do
    author = Author.create!(name: 'Stephen King', deceased: false, awards: 10)
    book1 = author.books.create!(name: 'The Stand', length: 1152, in_print: true)
    book2 = author.books.create!(name: 'It', length: 1138, in_print: true)
    book3 = author.books.create!(name: 'Carrie', length: 199, in_print: false)

    visit "/authors/#{author.id}"

    expect(page).to have_content("#{author.name} Books")
  end
end