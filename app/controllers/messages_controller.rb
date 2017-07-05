class MessagesController < ApplicationController
  def index
    @room = Room.find_by_id(params[:room_id])
    @messages = @room.messages
  end
  
  def create
    @room = Room.find_by(id: params[:room_id])
    @message = @room.messages.build(message_params)
    if @message.save
      flash[:success] = "Sent message"
    else
      flash[:error] = "Failed to sent message"
    end
    redirect_to room_messages_path(@room)
  end
  
  private
  def message_params
    params.require(:message).permit(:username, :content, :room_id)
  end
end
