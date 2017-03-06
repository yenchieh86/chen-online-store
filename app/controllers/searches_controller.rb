class SearchesController < ApplicationController
  def index
    @items = Item.search_by_title(params[:query])
    @status_in_word = Array.new
    
    @items.each_with_index do |item, index|
      string = Array.new
      item.status.split('_').map{ |word| string.push(word.capitalize) }
      @status_in_word.push(string.join(' '))
    end
  end
end
