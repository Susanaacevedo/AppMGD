json.extract! producto, :id, :codigo, :nombre, :precio, :stock, :created_at, :updated_at
json.url producto_url(producto, format: :json)
