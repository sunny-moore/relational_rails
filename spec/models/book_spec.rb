require 'rails_helper'

RSpec.describe Book do 
  describe 'relationships' do 
    it { should belong_to (:author) }
  end
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :length }
    it { should allow_value(true).for(:in_print) }
    it { should allow_value(false).for(:in_print) }
  end
  describe 'instance methods' do
    it 'filters out false values for in_print on Books index page' do
      author = Author.create!(name: 'Stephen King')
      book1 = author.books.create!(name: 'The Stand', length: 1152, in_print: true)
      book2 = author.books.create!(name: 'It', length: 1138, in_print: true)
      book3 = author.books.create!(name: 'Carrie', length: 199, in_print: false)

      books = Book.in_print_true
      book = books.where(in_print: false)

      expect(book).to eq([])
    end

  end
end