module Refinery
  module Productos
    class Producto < Refinery::Core::BaseModel
      self.table_name = 'refinery_productos'


      translates :nombre, :tipo, :material, :descripcion, :medidas, :estado, :espacio

      validates :nombre, :presence => true, :uniqueness => true

      belongs_to :foto, :class_name => '::Refinery::Image'

      belongs_to :imagen1, :class_name => '::Refinery::Image'

      belongs_to :imagen2, :class_name => '::Refinery::Image'

      belongs_to :imagen3, :class_name => '::Refinery::Image'

      belongs_to :imagen4, :class_name => '::Refinery::Image'

      belongs_to :plano1, :class_name => '::Refinery::Image'

      belongs_to :plano2, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
