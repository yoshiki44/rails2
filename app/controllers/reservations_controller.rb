class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @rooms = Room.where(user_id: current_user.id)
  end

  def new
    @reservation = Reservation.new(reservation_params)
    @room = Room.all
  end

  def create
      @reservation = current_user.reservations.build(reservation_params)
        binding.pry

      if @reservation.save
        binding.pry
          flash[:notice] = "予約が完了しました"
          redirect_to("/rooms/index")
      else
        binding.pry
          flash[:alert] = "予約に失敗しました"
          redirect_back(fallback_location: root_path)
      end
  end

  def reservation_params
    params.permit(:check_in, :check_out, :people, :room_id, :user_id)
  end
end
