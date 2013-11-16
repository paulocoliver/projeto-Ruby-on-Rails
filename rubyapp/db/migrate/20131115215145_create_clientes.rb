class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :documento
      t.string :endereco
      t.string :bairro
      t.string :cep
      t.references :cidade
      t.string :email
      t.string :fone_1
      t.string :fone_2

      t.timestamps
    end
    add_index :clientes, :cidade_id
  end
end
