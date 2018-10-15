class Prato < ApplicationRecord
	validates :nome, :preco, :tempo, presence: true
	belongs_to :category

	has_and_belongs_to_many :ingredientes, -> { order(:nome => :asc) }
	has_and_belongs_to_many :restaurantes, -> { order(:nome => :asc) }

end
