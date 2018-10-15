class Restaurante < ApplicationRecord
	validates :nome, :telefone, :endereco, presence: true
	
	has_and_belongs_to_many :pratos, -> { order(:nome => :asc) }


	def self.search(search)
		where.("nome LIKE ?", "%#{search}%") 
		# where("pratos.nome LIKE ?", "%#{search}%") 
		# where("content LIKE ?", "%#{search}%")
	end
end
