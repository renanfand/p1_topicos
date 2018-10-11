class CreatePratos < ActiveRecord::Migration[5.2]
  def change
    create_table :pratos do |t|
      t.string :nome
      t.float :preco
      t.time :tempo

      t.timestamps
    end
  end
end
