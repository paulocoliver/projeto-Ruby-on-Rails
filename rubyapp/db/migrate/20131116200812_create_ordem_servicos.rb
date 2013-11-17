class CreateOrdemServicos < ActiveRecord::Migration
  def change
    create_table :ordem_servicos do |t|
      t.references :cliente
      t.references :veiculo
      t.references :cronotacografo
      t.date :data_servico
      t.references :funcionario

      t.timestamps
    end
    add_index :ordem_servicos, :cliente_id
    add_index :ordem_servicos, :veiculo_id
    add_index :ordem_servicos, :cronotacografo_id
    add_index :ordem_servicos, :funcionario_id
  end
end
