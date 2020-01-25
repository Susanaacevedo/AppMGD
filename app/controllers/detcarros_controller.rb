class DetcarrosController < ApplicationController
before_action :authenticate_user!
def index
  @detcarros = current_user.detcarros.where(payed: false)
  @total = @detcarros.pluck("precio * cantidad").sum
end

def create

  @producto = Producto.find(params[:producto_id])
  @detcarro = Detcarro.new()
  @detcarro.producto = @producto
  @detcarro.user     = current_user
  @detcarro.cantidad     = 1
  @detcarro.precio       = @producto.precio
  @detcarro.payed = "false"


  if @detcarro.save
    redirect_to root_path, notice: 'Producto Ingresado en Carro de Compra'
  else
    redirect_to root_path, alert: 'Producto NO Ingresado en Carro de Compra'
  end
end


def clean
  @detcarros = Detcarro.where(user: current_user, payed: false)
  @detcarros.destroy_all
  redirect_to detcarros_path, notice: 'El carro se ha vaciado.'
end




end
