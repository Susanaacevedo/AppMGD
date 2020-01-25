class BillingsController < ApplicationController
  def pre_pay
    detcarros = current_user.detcarros.where(payed: false)
    total = detcarros.pluck("precio * cantidad").sum()
    items = detcarros.map do |order|
      item = {}
      item[:name] = detcarro.producto.name
      item[:sku] = detcarro.id.to_s
      item[:price] =  detcarro.precio.to_s
      item[:currency] =  "USD"
      item[:quantity] = detcarro.cantidad
      item
  end
end
