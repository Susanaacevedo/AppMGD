class BillingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @billings = current_user.billings
  end

# metodo obtengo el total de carro lo sumo genero un hash en donde
# paso los atribtuos que son necesarios para has de paypal

  def pre_pay
    detcarros = current_user.detcarros.where(payed: false)
    total = detcarros.pluck("precio * cantidad").sum()
    items = detcarros.map do |order|
      item = {}
      item[:name] = order.producto.nombre
      item[:sku] = order.id.to_s
      item[:price] =  order.precio.to_s
      item[:currency] =  "USD"
      item[:quantity] = order.cantidad
      item
  end

# este es el hash que se envia a PayPal donde esta el total
#
  @payment = PayPal::SDK::REST::Payment.new({
  :intent =>  "sale",
  :payer =>  {
    :payment_method =>  "paypal" },
  :redirect_urls => {
    :return_url => "http://localhost:3000/billings/execute",
    :cancel_url => "http://localhost:3000/" },
  :transactions =>  [{
    :item_list => {
      :items => items
    },
    :amount =>  {
      :total =>  total,
      :currency =>  "USD" },
    :description =>  "Carro de compras." }]})

    if @payment.create
      redirect_url = @payment.links.find{|v| v.method == "REDIRECT" }.href
      redirect_to redirect_url
    else
      ':)'
    end
  end

# es la respuesta de PayPal
    def execute
      paypal_payment = PayPal::SDK::REST::Payment.find(params[:paymentId])
      if paypal_payment.execute(payer_id: params[:PayerID])
        amount = paypal_payment.transactions.first.amount.total
        billing = Billing.create(
          user: current_user,
          code: paypal_payment.id,
          payment_method: 'paypal',
          amount: amount,
          currency: 'USD'
        )
        detcarros = current_user.detcarros.where(payed: false)
        detcarros.update_all(payed: true, billing_id: billing.id)
        redirect_to root_path, notice: "La compra se realizo con exito"
      else
        render plain; "no se pudo generar el cobro en Paypal"
      end

    end

end
