class BooksController < ApplicationController
  def index
     # binding.pry
    @books = Book.all
  end
end