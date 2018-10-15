class Category < ApplicationRecord
	validates :nome, presence: true
end
