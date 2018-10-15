class Ingrediente < ApplicationRecord
	validates :nome, presence: true

	has_and_belongs_to_many :pratos
end
