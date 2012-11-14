class BooksController < ApplicationController

  def index
  end

  def get_results
    if request.xhr?
      if params['search_text'].strip.length > 0
        terms = params['search_text'].split.collect do |word|  
          "%#{word.downcase}%" 
        end     
        @books = Book.find(
          :all,   
          :conditions => [
            ( ["(LOWER(title) LIKE ?)"] * terms.size ).join(" AND "),
            * terms.flatten
          ]       
        )       
      end     
      render :partial => "search" 
    else    
      redirect_to :action => "index" 
    end
  end
end