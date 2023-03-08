class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail_address
      t.string :password
      t.text :introduction
      t.string :icon

      t.timestamps
    end
  end
end
