class AuthorsController < ApplicationController
  def index
    @authors = Author.order_by_created_at
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    @author = Author.create(author_params)
    redirect_to '/authors'
  end
  
  def edit 
    @author = Author.find(params[:id])
  end
  
  def update 
    @author = Author.find(params[:id])
    @author.update(author_params)
    redirect_to "/authors/#{@author.id}"
  end
  
  private
  def author_params
    params.permit(:name, :awards, :deceased)
  end
end