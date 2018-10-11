json.extract! restaurante, :id, :nome, :telefone, :endereco, :created_at, :updated_at
json.url restaurante_url(restaurante, format: :json)
