class AuthorsController < ApplicationController
  def index 
    @authors = Author.order_by_created_at
  end

  def show 
    @author = Author.find(params[:id])
  end
end