class UpdateItemVisitCountJob < ApplicationJob
  queue_as :default

  def perform(item_id)
    # Do something later
    
    logger.info 'update item visit count begin'
    @item = Item.find(item_id)
    @item.visit_count += 1
    @item.save!(validate: false)
    logger.info 'update item visit count end'
  end
end
