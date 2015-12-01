module Refinery
  module Productos
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Productos

      engine_name :refinery_productos

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "productos"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.productos_admin_productos_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Productos)
      end
    end
  end
end
