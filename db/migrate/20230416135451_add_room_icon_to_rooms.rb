class AddRoomIconToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :room_icon, :string
  end
end
