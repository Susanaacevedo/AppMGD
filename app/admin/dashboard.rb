ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do


    columns do
          panel 'Productos totales en el sistema' do
            ul do
              Producto.last(5).map do |prod|
                li link_to(prod.nombre, admin_producto_path(prod))
              end
            end
            li "Productos totales #{Producto.count}"
          end
        end
  end # content
end
