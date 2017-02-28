class SearchesController < ApplicationController
  def index
    results = PgSearch.multisearch(params[:query])
    @items = Array.new
    
    results.each do |result|
      i = Item.find(result.id)
      @items.push(i)
    end
    
    @items
  end
end
