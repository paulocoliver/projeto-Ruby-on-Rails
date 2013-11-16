class CreateVeiculos < ActiveRecord::Migration
  def change
    create_table :veiculos do |t|
      t.string :placa
      t.string :marca
      t.string :modelo
      t.string :ano
      t.string :pneu
      t.string :chassi
      t.string :renavam
      t.string :coeficiente
      t.string :redutor
      t.references :cliente

      t.timestamps
    end
    add_index :veiculos, :cliente_id
  end
end
