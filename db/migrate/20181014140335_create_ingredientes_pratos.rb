class CreateIngredientesPratos < ActiveRecord::Migration[5.2]
	def change
		create_table :ingredientes_pratos do |t|
			t.integer :ingrediente_id
			t.integer :prato_id
		end
	end
end
