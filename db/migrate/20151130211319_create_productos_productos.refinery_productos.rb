# This migration comes from refinery_productos (originally 1)
class CreateProductosProductos < ActiveRecord::Migration

  def up
    create_table :refinery_productos do |t|
      t.string :nombre
      t.float :precio
      t.string :tipo
      t.string :material
      t.string :categoria
      t.text :descripcion
      t.text :medidas
      t.string :estado
      t.string :espacio
      t.integer :foto_id
      t.integer :imagen1_id
      t.integer :imagen2_id
      t.integer :imagen3_id
      t.integer :imagen4_id
      t.integer :plano1_id
      t.integer :plano2_id
      t.integer :position

      t.timestamps
    end

    Refinery::Productos::Producto.create_translation_table! :nombre => :string, :tipo => :string, :material => :string, :descripcion => :text, :medidas => :text, :estado => :string, :espacio => :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-productos"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/productos/productos"})
    end

    drop_table :refinery_productos

    Refinery::Productos::Producto.drop_translation_table!

  end

end
