require 'rails_helper'

RSpec.describe 'authors#index', type: :feature do

  it 'can show all the authors (User Story 1)' do
    author1 = Author.create!(name: 'Stephen King')
    author2 = Author.create!(name: 'Charles Dickens')
    visit '/authors'

    expect(page).to have_content(author1.name)
    expect(page).to have_content(author2.name)
  end

  it 'shows all authors, sorted by most recently created(User Story 6)' do 
    author1 = Author.create!(name: 'Stephen King')
    author2 = Author.create!(name: 'Charles Dickens')

    visit '/authors'
    
    expect(page.body.index(author2.name)).to be < (page.body.index(author1.name))
  end

  it 'every page has a link to Authors Index(User Story 9)' do
    author1 = Author.create!(name: 'Stephen King')

    visit "/authors/#{author1.id}"
    expect(page).to have_content('Authors Index')
    visit "/authors/"
    expect(page).to have_content('Authors Index')
  end
end