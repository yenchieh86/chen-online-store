class SearchesController < ApplicationController
  def index
    @items = Item.search_by_title(params[:query])
  end
end
