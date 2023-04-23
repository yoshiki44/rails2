class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new()
  end

  def create
      @room = current_user.rooms.build(room_params)
      if @room.save
          flash[:notice] = "施設を新規登録しました"
          redirect_to("/rooms/new")
      else
          flash[:alert] = "登録に失敗しました"
          render "rooms/new"
      end
  end

  def room_params
    params.permit(:name, :detail, :price, :address, :room_icon)
  end

  def show
    @room = Room.find_by(id: params[:id])
  end
end
