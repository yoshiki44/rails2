class AddIntroductionToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :introduction, :string
  end
end
