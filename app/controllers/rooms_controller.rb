class RoomsController < ApplicationController
  def create

    room = Room.new(room_create_params)
    if room.save
      flash[:success] = "Room created"
    else 
      flash[:error] = "Some errors occured"
    end
    redirect_to root_path
  end

  def show
    @room = Room.find_by_id(params[:id])
    redirect_to room_messages_path(@room)
  end
  private

  def room_create_params
    params.require(:room).permit(:name)
  end
end
