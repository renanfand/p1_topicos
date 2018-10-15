json.extract! prato, :id, :nome, :preco, :tempo, :created_at, :updated_at
json.url prato_url(prato, format: :json)
