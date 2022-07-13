# User Story 13, Parent Child Creation 

# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
require 'rails_helper'

RSpec.describe 'Author_books create' do
  it 'can click a link on /authors/:id/books to create new book for that author' do
    author = Author.create!(name: 'Stephen King', deceased: false, awards: 10)
    book1 = author.books.create!(name: 'The Stand', length: 1152, in_print: true)
    book2 = author.books.create!(name: 'It', length: 1138, in_print: true)

    visit "/authors/#{author.id}/books"
    click_on('Add Book')

    expect(current_path).to eq("/authors/#{author.id}/books/new")
  end
  it 'filling out the form creates a new book and redirects to authors  book page' do
    author = Author.create!(name: 'Stephen King', deceased: false, awards: 10)
    book1 = author.books.create!(name: 'The Stand', length: 1152, in_print: true)
    book2 = author.books.create!(name: 'It', length: 1138, in_print: true)
  
    visit "/authors/#{author.id}/books"
    click_on('Add Book')

    fill_in('Name', with: 'Needful Things')
    fill_in('Length', with: 642)
    fill_in('In print', with: false)
    click_on('Add Book')
    expect(current_path).to eq("/authors/#{author.id}/books")
    expect(page).to have_content('Needful Things')
  end
end