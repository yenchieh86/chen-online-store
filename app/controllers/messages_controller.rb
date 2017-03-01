class MessagesController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def show
  end

  def new
    @message = current_user.messages.new
  end
  
  def create
    @message = current_user.messages.build(message_params)
    
    if @message.save
      OwnerNoticeMailer.notify_message.deliver_now!
      flash[:notice] = 'Thank you for your message, we will get back to you ASAP.'
      redirect_to root_path
    else
      flash[:alert] = @message.errors.full_messages
      render :new
    end
  end

  def edit
  end
  
  private
  
    def message_params
      params.require(:message).permit(:title, :body)
    end
    
end
