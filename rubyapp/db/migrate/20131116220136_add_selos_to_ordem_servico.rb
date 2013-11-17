class AddSelosToOrdemServico < ActiveRecord::Migration
  def change
    add_column :ordem_servicos, :selo_plastico_colocado, :string
    add_column :ordem_servicos, :selo_plastico_retirado, :string
    add_column :ordem_servicos, :selo_adesivo_colocado, :string
    add_column :ordem_servicos, :selo_adesivo_retirado, :string
  end
end
