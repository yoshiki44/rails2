class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @rooms = Room.where(user_id: current_user.id)
  end

  def new
    @reservation = Reservations.new()
  end

  def create
      @reservation = current_user.reservations.create(reservation_params)

      if @reservation.save
          flash[:notice] = "予約が完了しました"
          redirect_to("/rooms/index")
      else
          flash[:alert] = "予約に失敗しました"
          redirect_back(fallback_location: root_path)
      end
  end

  def reservation_params
    params.permit(:check_in, :check_out, :people)
  end
end
