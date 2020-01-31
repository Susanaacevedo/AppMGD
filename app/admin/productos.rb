ActiveAdmin.register Producto do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :codigo, :nombre, :precio, :stock, :photo
  #
  # or
  #
  # permit_params do
  #   permitted = [:codigo, :nombre, :precio, :stock, :photo]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
permit_params :nombre, :precio, :stock
  index do
  column :nombre
  column :precio
  column :stock
  actions
end

form do |f|
  inputs 'Agregar un nuevo roducto' do
    input :nombre
    input :precio
    input :stock

  end
  actions
end

end
