class CreateRestaurantes < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurantes do |t|
      t.string :nome
      t.string :telefone
      t.string :endereco

      t.timestamps
    end
  end
end
