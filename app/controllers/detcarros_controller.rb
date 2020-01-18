class DetcarrosController < ApplicationController
before_action :authenticate_user!
def index
  @detcarros = current_user.detcarros

end

def create

  @producto = Producto.find(params[:producto_id])
  @detcarro = Detcarro.new()
  @detcarro.producto = @producto
  @detcarro.user     = current_user
  @detcarro.cantidad     = 1
  @detcarro.precio       = @producto.precio


  if @detcarro.save
     redirect_to root_path, notice: 'Producto Ingresado en Carro de Compra'
  else
     redirect_to root_path, alert: 'Producto NO Ingresado en Carro de Compra'
  end
end



end
