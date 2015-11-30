module Refinery
  module Productos
    module Admin
      class ProductosController < ::Refinery::AdminController

        crudify :'refinery/productos/producto',
                :title_attribute => 'nombre'

        private

        # Only allow a trusted parameter "white list" through.
        def producto_params
          params.require(:producto).permit(:nombre, :precio, :tipo, :material, :categoria, :descripcion, :medidas, :estado, :espacio, :foto_id, :imagen1_id, :imagen2_id, :imagen3_id, :imagen4_id, :plano1_id, :plano2_id)
        end
      end
    end
  end
end
